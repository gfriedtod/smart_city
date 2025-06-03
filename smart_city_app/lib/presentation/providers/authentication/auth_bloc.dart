import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_city_app/domain/application/i_auth.dart';
import 'package:smart_city_app/domain/dto/AuthRequest.dart';
import 'package:smart_city_app/domain/dto/RegisterRequest.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuth authRepository;
  AuthBloc(this.authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        login: (e) async {
          emit(const AuthState.loading());
          try {
            await authRepository.login(
              AuthRequest(username: e.email, password: e.password),
            );
            emit(const AuthState.authenticated());
          } catch (e) {
            if (e is DioException) {
              emit(AuthState.failure("${e.message}"));
            } else {
              emit(AuthState.failure("BAD CREDENTIALS"));
            }
          }
        },
        register: (e) async {
          emit(const AuthState.loading());
          try {
            await authRepository.register(
              RegisterRequest()
                ..email = e.email
                ..password = e.password
                ..username = e.username,
            );
            emit(const AuthState.authenticated());
          } catch (e) {
            if (e is DioException) {
              emit(AuthState.failure("${e.response?.data}"));
            } else {
              emit(AuthState.failure("BAD CREDENTIALS"));
            }
          }
        },
        started: (_Started value) {},
        logout: (_Logout value) {},
      );
    });
  }
}
