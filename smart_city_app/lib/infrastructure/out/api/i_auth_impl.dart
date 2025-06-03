import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';
import 'package:smart_city_app/core/constants/api.dart';
import 'package:smart_city_app/domain/application/i_auth.dart';
import 'package:smart_city_app/domain/dto/AuthRequest.dart';
import 'package:smart_city_app/domain/dto/AuthResponse.dart';
import 'package:smart_city_app/domain/dto/RegisterRequest.dart';

class IAuthImpl extends IAuth {
  final Dio dio;

  IAuthImpl(this.dio);
  @override
  Future<AuthResponse> login(AuthRequest auth) async {
    try {
      final response = await dio.post(ApiEndpoint.login.url, data: auth.toJson());
      var data = AuthResponse.fromJson(response.data);
      localStorage.setItem('user', jsonEncode(data.toJson()));
      return data ;
    } catch (e,trace) {
      log(e.toString());
      log(trace.toString());
      rethrow;
    }
  }

  @override
  Future<AuthResponse> register(RegisterRequest register) async {
    try {
      final response = await dio.post(ApiEndpoint.register.url, data: register.toJson());
      var data = AuthResponse.fromJson(response.data);
      localStorage.setItem('user', jsonEncode(data.toJson()));
      return data ;
    } on DioException catch (e, trace) {
      log(e.toString());
      log(trace.toString());
      rethrow;
    }
  }
}
