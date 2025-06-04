import 'package:uuid/uuid.dart';
import 'package:meta/meta.dart';

import 'CategoryDto.dart';
import 'UserDto.dart';

/**
 * DTO for {@link com.yans.smart_api.entity.Incident}
 */
@immutable
class IncidentDto {
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final double? longitude;
  final double? latitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserDto? user;
  final CategoryDto? category;
  final IncidentStatus? status;
  final String? address;

  const IncidentDto({
    this.id,
    this.name,
    this.address,
    this.description,
    this.image,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.category,
    this.status,
  });

  factory IncidentDto.fromJson(Map<String, dynamic> json) {
    return IncidentDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      createdAt: DateTime.parse(json['createdAt']), //json['createdAt'],
      updatedAt: DateTime.parse(json['updatedAt']), //json['updatedAt'],
      user: UserDto.fromJson(json['user']),
      category: CategoryDto.fromJson(json['category']),
      status: IncidentStatus.values.byName(json['status']), //IncidentStatus.values[json['status']],
      address: json['address'],
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'user': user?.toJson(),
      'category': category?.toJson(),
      'status': status?.name,
      'address': address,
    };
  }

  IncidentDto copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    double? longitude,
    double? latitude,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserDto? user,
    CategoryDto? category,
    IncidentStatus? status,
    String? address,
  }) {
    return IncidentDto(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      category: category ?? this.category,
      status: status ?? this.status,
      address: address ?? this.address,
    );
  }

  // Builder functionality can be achieved through named constructors or other patterns in Dart,
  // but no additional functionality has been added.
}

enum IncidentStatus {
  SUBMIT('SUBMIT'),
  IN_PROGRESS('IN_PROGRESS'),
  RESOLVED('RESOLVED');

  const IncidentStatus(this.url);

  /// The complete URL for the endpoint
  final String url;
}
