import 'package:smart_city_app/domain/dto/IncidentDto.dart';

class ChangeIncidentStatusRequest {
  final IncidentStatus? status;
  final String? id;

  ChangeIncidentStatusRequest({this.status, this.id});

  Map<String, dynamic> toJson() => {'status': status?.name, 'id': id};
}
