import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_city_app/core/constants/route.dart';
import 'package:smart_city_app/domain/dto/CategoryDto.dart';
import 'package:smart_city_app/fake_core/data/model/incident.dart';

import '../../../core/constants/api.dart';
import '../../../domain/application/i_incident.dart';
import '../../../domain/dto/IncidentDto.dart';

class IIncidentImpl extends IIncident {
  final Dio dio;

  IIncidentImpl(this.dio);
  @override
  Future<void> addIncident(IncidentDto incident) async {
    try {
      await dio.post(ApiEndpoint.incidents.url, data: incident.toJson());
      log('Incident added');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<IncidentDto>> getIncidents() async {
    try {
      final response = await dio.get(ApiEndpoint.incidents.url);
      final List<IncidentDto> data = (response.data as List)
          .map<IncidentDto>((value) => IncidentDto.fromJson(value))
          .toList();
      return data;
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryDto>> getAllCategory() async {
    try {
      final response = await dio.get(ApiEndpoint.category.url);
      return (response.data as List)
          .map<CategoryDto>((value) => CategoryDto.fromJson(value))
          .toList();
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
      rethrow;
    }
  }
}
