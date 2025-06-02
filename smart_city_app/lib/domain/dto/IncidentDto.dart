import 'package:uuid/uuid.dart';
import 'package:meta/meta.dart';

import 'CategoryDto.dart';
import 'UserDto.dart';

/**
 * DTO for {@link com.yans.smart_api.entity.Incident}
 */
@immutable
class IncidentDto {
  final Uuid id;
  final String name;
  final String description;
  final String image;
  final double longitude;
  final double latitude;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserDto user;
  final CategoryDto category;
  final IncidentStatus status;

  const IncidentDto({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.longitude,
    required this.latitude,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.category,
    required this.status,
  });

  factory IncidentDto.fromJson(Map<String, dynamic> json) {
    return IncidentDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: UserDto.fromJson(json['user']),
      category: CategoryDto.fromJson(json['category']),
      status: IncidentStatus.values[json['status']],
    );
  }

//   to json
 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'longitude': longitude,
      'latitude': latitude,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'user': user.toJson(),
      'category': category.toJson(),
      'status': status.index,
    };
 }
// Builder functionality can be achieved through named constructors or other patterns in Dart,
// but no additional functionality has been added.
}
enum  IncidentStatus {
  SUBMIT,
  IN_PROGRESS,
  RESOLVED
}