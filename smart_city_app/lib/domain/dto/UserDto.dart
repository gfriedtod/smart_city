import 'package:meta/meta.dart';
import 'dart:convert';

/**
 * DTO for AppUser
 */
@immutable
class UserDto {
  final String id;
  final String username;
  final String password;
  final DateTime updatedAt;
  final DateTime createdAt;
  final bool? isActive;
  final String? email;
  final String? profile;

  const UserDto({
    required this.id,
    required this.username,
    required this.password,
    required this.updatedAt,
    required this.createdAt,
    this.isActive,
    this.email,
    this.profile,
  });

  UserDto copyWith({
    String? id,
    String? username,
    String? password,
    DateTime? updatedAt,
    DateTime? createdAt,
    bool? isActive,
    String? email,
    String? profile,
  }) {
    return UserDto(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      email: email ?? this.email,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
      'email': email,
      'profile': profile,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] ?? '',
      username: map['username'] as String,
      password: map['password'] as String,
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      createdAt: DateTime.parse(map['createdAt'] as String),
      isActive: map['isActive'] as bool?,
      email: map['email'] as String?,
      profile: map['profile'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'password': password,
    'updatedAt': updatedAt.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
    'isActive': isActive,
    'email': email,
    'profile': profile,
  };
  factory UserDto.fromJson(Map<String, dynamic> source) {
    return UserDto(
      id: source['id'],
      username: source['username'] as String,
      password: source['password'] as String,
      updatedAt: DateTime.parse(source['updatedAt'] as String),
      createdAt: DateTime.parse(source['createdAt'] as String),
      isActive: source['isActive'] as bool?,
      email: source['email'] as String?,
      profile: source['profile'],
    );
  }
}

enum UserProfile { USER, ADMIN, SUPERADMIN }
