import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_city_app/core/constants/route.dart';
import 'package:smart_city_app/fake_core/data/model/incident.dart';

import '../../../core/constants/api.dart';
import '../../../domain/application/i_incident.dart';

class IIncidentImpl extends IIncident {
  final Dio dio;

  IIncidentImpl({required this.dio});
  @override
  Future<void> addIncident(Incident incident) async {
    try {
      await dio.post(ApiEndpoint.incidents.url, data: incident.toJson());
      log('Incident added');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Incident> getIncidents() async {
    try {
      final response = await dio.get(ApiEndpoint.incidents.url);
      return response.data.map((value) => Incident.fromMap(value.data));
    } catch (e) {
      rethrow;
    }
  }
}
