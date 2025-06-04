import 'package:smart_city_app/domain/dto/CategoryDto.dart';

import '../dto/IncidentDto.dart';

abstract class IIncident {
  Future<List<IncidentDto>> getIncidents();
  Future<void> addIncident(IncidentDto incident);
  Future<List<CategoryDto>> getAllCategory();
}
