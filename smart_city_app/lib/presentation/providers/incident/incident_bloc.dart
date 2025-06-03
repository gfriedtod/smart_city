import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_city_app/infrastructure/out/api/i_incident_impl.dart';

import '../../../fake_core/data/model/incident.dart';

part 'incident_event.dart';
part 'incident_state.dart';
part 'incident_bloc.freezed.dart';

class IncidentBloc extends Bloc<IncidentEvent, IncidentState> {
  final IIncidentImpl incidentImpl;
  IncidentBloc(this.incidentImpl) : super(const IncidentState.initial()) {
    on<IncidentEvent>((event, emit) {
      event.map(
        getIncidents: (e) async {
          try {
            emit(const IncidentState.loading());
            final incidents = await incidentImpl.getIncidents();
            if (incidents.isEmpty) {
              emit(const IncidentState.empty());
            } else {
              emit(IncidentState.loaded(incidents));
            }
          } catch (e) {
            log(e.toString());
            emit(IncidentState.error("we have an error"));
          }
        },
        started: (_Started value) {},
        createIncident: (_CreateIncident value) {
          try {
            incidentImpl.addIncident(value.incident);
          } catch (e) {
            log(e.toString());
            emit(IncidentState.error("we have an error"));
          }
        },
      );
    });
  }
}
