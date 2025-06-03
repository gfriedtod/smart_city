import 'package:meta/meta.dart';

@immutable
class AuthRequest {
  final String username;
  final String password;

  const AuthRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}