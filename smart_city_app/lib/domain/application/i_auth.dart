 import '../dto/AuthRequest.dart';
import '../dto/AuthResponse.dart';
import '../dto/RegisterRequest.dart';

abstract class IAuth {
  Future<AuthResponse> login(AuthRequest auth);
  Future<AuthResponse> register(RegisterRequest register);
}