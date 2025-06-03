import 'package:smart_city_app/fake_core/data/model/incident.dart';

abstract class IIncident {
  Future<List<Incident>> getIncidents();
  Future<void> addIncident(Incident incident);
}
