part of 'incident_bloc.dart';

@freezed
class IncidentState with _$IncidentState {
  const factory IncidentState.initial() = _Initial;
  const factory IncidentState.loading() = _Loading;
  const factory IncidentState.loaded(List<IncidentDto> incidents) = _Loaded;
  const factory IncidentState.empty() = _Empty;
  const factory IncidentState.success() = _Success;
  const factory IncidentState.error(String message) = _Error;
}
