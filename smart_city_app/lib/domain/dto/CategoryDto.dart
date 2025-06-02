// DTO for com.yans.smart_api.entity.Category
import 'package:meta/meta.dart';

@immutable
class CategoryDto {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;

  const CategoryDto({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  CategoryDto copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
  }) {
    return CategoryDto(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
    );
  }

  static fromJson(json) {
    return CategoryDto(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'isActive': isActive,
  };
}