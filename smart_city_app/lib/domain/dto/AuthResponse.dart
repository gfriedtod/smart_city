import 'dart:convert';
import 'dart:developer' show log;

import 'UserDto.dart';

class AuthResponse {
  String? token;
  UserDto? user;

  AuthResponse({this.token, this.user});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    log(json['user'].toString());
    log(json['user'].runtimeType.toString());
    token = json['token'];
    user = UserDto.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user?.toJson()};
  }
}
