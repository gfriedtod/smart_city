import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dart_amqp/dart_amqp.dart';
import 'package:localstorage/localstorage.dart';
import 'package:smart_city_app/domain/dto/AuthResponse.dart';

import 'notification/notification_services.dart';

class RabbitMQService {
  static final RabbitMQService _instance = RabbitMQService._internal();
  factory RabbitMQService() => _instance;

  RabbitMQService._internal(); // Constructeur privé pour singleton

  Client? _client;
  Channel? _channel;
  bool _isConnected = false;
  int _retryCount = 0;
  final int _maxRetries = 5;

  final StreamController<String> _notificationsController =
      StreamController.broadcast();
  final StreamController<String> _statusUpdatesController =
      StreamController.broadcast();
  final StreamController<String> _privateMessagesController =
      StreamController.broadcast();

  final StreamController<String> _orderController =
      StreamController.broadcast();

  Stream<String> get notificationsStream => _notificationsController.stream;
  Stream<String> get statusUpdatesStream => _statusUpdatesController.stream;
  Stream<String> get privateMessagesStream => _privateMessagesController.stream;
  Stream<String> get orderStream => _orderController.stream;

  Future<void> connect() async {
    if (_isConnected) return; // Évite plusieurs connexions

    try {
      log("🔌 Connexion à RabbitMQ...");
      _client = Client(
        settings: ConnectionSettings(
          // host: "37.60.239.221",
          host: "10.0.2.2",
          port: 5672,
          authProvider: const PlainAuthenticator("guest", "guest"),
        ),
      );

      _channel = await _client!.channel();
      AuthResponse user = AuthResponse.fromJson(
        const JsonDecoder().convert(localStorage.getItem('user')!),
      );

      // _listenQueue("general", _notificationsController);
      _listenQueue(
        "notification-${user.user?.email ?? ''}",
        _statusUpdatesController,
      );
      _listenQueue("${user.user?.email ?? ''}", _privateMessagesController);
      _isConnected = true;
      _retryCount = 0;
      log("✅ Connecté à RabbitMQ !");
    } catch (e) {
      log("❌ Erreur de connexion: $e");
      _isConnected = false;
      _scheduleReconnect();
    }
  }

  void _listenQueue(
    String queueName,
    StreamController<dynamic> controller,
  ) async {
    Queue queue;
    AuthResponse user = AuthResponse.fromJson(
      const JsonDecoder().convert(localStorage.getItem('user')!),
    );
    Consumer? consumer;

    try {
      // User user = User.fromJson(JsonDecoder().convert(localStorage.getItem('user')!));

      if (queueName == "${user.user?.email ?? ''}" ||
          queueName == "notification-${user.user?.email ?? ''}") {
        queue = await _channel!.queue(queueName, durable: false);
        if (queueName == "notification-${user.user?.email ?? ''}") {
          Exchange? exchange = await _channel?.exchange(
            "general",
            ExchangeType.FANOUT,
            durable: true,
          );
          queue = await queue.bind(exchange!, '');
        }
      } else {
        queue = await _channel!.queue(queueName, durable: true);
      }
      consumer = await queue.consume();
    } on ChannelException catch (e) {
      log("❌ Erreur d'écoute sur $queueName: $e");

      queue = await _channel!.queue(queueName, durable: false);
      log("✅ Ecoute sur $queueName");

      // _scheduleReconnect();
    }
    consumer?.listen((AmqpMessage message) {
      // log("📩 Message reçu de $queueName: ${message.payloadAsString}");

      controller.add(message.payloadAsString);

      if (queueName == "general") {
        NotificationService.showNotification(
          "Nouvelle alerte",
          message.payloadAsString,
        );
      }

      if (queueName == "notification-${user.user?.email ?? ''}" ||
          queueName == "${user.user?.email ?? ''}") {
        log("📩 Message reçu de $queueName: ${message.payloadAsString}");
        ;

        NotificationService.showNotification(
          "Nouvelle alerte",
          message.payloadAsString,
        );
      }
    });
  }

  void _scheduleReconnect() {
    if (_retryCount >= _maxRetries) {
      log("🚨 Trop de tentatives, abandon.");
      return;
    }

    _retryCount++;
    int delay = _retryCount * 5;
    log("🔄 Tentative de reconnexion dans $delay secondes...");
    Future.delayed(Duration(seconds: delay), connect);
  }

  void _scheduleReconnectV2() {
    if (_retryCount >= _maxRetries) {
      log("🚨 Trop de tentatives, abandon.");
      return;
    }

    _retryCount++;
    int delay = _retryCount * 5;
    log("🔄 Tentative de reconnexion dans $delay secondes...");
    Future.delayed(Duration(seconds: delay), connectJustTwo);
  }

  void close() {
    log("🔌 Fermeture de RabbitMQ.");
    _isConnected = false;
    _client?.close();
    _notificationsController.close();
    _statusUpdatesController.close();
    _privateMessagesController.close();
  }

  connectJustTwo() async {
    if (_isConnected) return; // Évite plusieurs connexions

    try {
      log("🔌 Connexion à RabbitMQ...");
      _client = Client(
        settings: ConnectionSettings(
          host: "37.60.239.221",
          // host: "10.0.2.2",
          port: 5672,
          authProvider: const PlainAuthenticator("guest", "guest"),
        ),
      );

      _channel = await _client!.channel();
      AuthResponse user = AuthResponse.fromJson(
        const JsonDecoder().convert(localStorage.getItem('restaurant')!),
      );

      // _listenQueue("general", _notificationsController);
      _listenQueue(
        "notification-${user.user?.email ?? ''}",
        _statusUpdatesController,
      );
      // _listenQueue("${user.id}", _privateMessagesController);
      _isConnected = true;
      _retryCount = 0;
      log("✅ Connecté à RabbitMQ !");
    } catch (e) {
      log("❌ Erreur de connexion: $e");
      _isConnected = false;
      _scheduleReconnectV2();
    }
  }
}
