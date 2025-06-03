part of 'incident_bloc.dart';

@freezed
class IncidentEvent with _$IncidentEvent {
  const factory IncidentEvent.started() = _Started;

  const factory IncidentEvent.getIncidents() = _GetIncidents;

  const factory IncidentEvent.createIncident({
    required Incident incident,
  }) = _CreateIncident;
}
