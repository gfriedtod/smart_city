part of 'incident_bloc.dart';

@freezed
class IncidentEvent with _$IncidentEvent {
  const factory IncidentEvent.started() = _Started;

  const factory IncidentEvent.getIncidents() = _GetIncidents;

  const factory IncidentEvent.createIncident({
    required IncidentDto incident, required File image
  }) = _CreateIncident;

  const factory IncidentEvent.updateIncident({
    required ChangeIncidentStatusRequest incident
  }) = _UpdateIncident;
}
