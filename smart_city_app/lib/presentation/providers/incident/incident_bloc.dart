import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_city_app/core/constants/api.dart';
import 'package:smart_city_app/domain/dto/IncidentDto.dart';
import '../../../domain/application/i_incident.dart';
import '../../../domain/dto/CategoryDto.dart';

part 'incident_event.dart';
part 'incident_state.dart';
part 'incident_bloc.freezed.dart';

class IncidentBloc extends Bloc<IncidentEvent, IncidentState> {
  final IIncident incidentImpl;
  List<IncidentDto> incidents = [];
  List<CategoryDto> categorys = [];
  IncidentBloc(this.incidentImpl) : super(const IncidentState.initial()) {
    on<IncidentEvent>((event, emit) async {
      await event.map(
        getIncidents: (e) async {
          try {
            emit(const IncidentState.loading());
            final incidents = await incidentImpl.getIncidents();
            this.incidents = incidents;
            final categorys = await incidentImpl.getAllCategory();
            this.categorys = categorys;
            if (incidents.isEmpty) {
              emit(const IncidentState.empty());
            } else {
              emit(IncidentState.loaded(this.incidents));
            }
          } catch (e) {
            log(e.toString());
            emit(IncidentState.error("we have an error"));
          }
        },
        started: (_Started value) {},
        createIncident: (_CreateIncident value) async {
          try {
            emit(const IncidentState.loading());
            String imageUrl = await uploadFile(value.image);
            final incident = value.incident.copyWith(image: imageUrl);
            incidentImpl.addIncident(incident);
            emit(const IncidentState.success());
          } catch (e,trace) {
            log(trace.toString());
            emit(IncidentState.error("we have an error"));
          }
        },
      );
    });
  }
}
