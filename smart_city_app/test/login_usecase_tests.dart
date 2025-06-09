import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_city_app/domain/application/i_auth.dart';
import 'package:smart_city_app/domain/dto/AuthRequest.dart';
import 'package:smart_city_app/domain/dto/AuthResponse.dart';
import 'package:smart_city_app/domain/dto/UserDto.dart';
import 'package:smart_city_app/infrastructure/out/api/i_auth_impl.dart';

class MockAuthRepository extends Mock implements IAuth {}

void main() {
  late IAuthImpl loginUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('LoginUsecase', () {
    final tUsername = 'testuser';
    final tPassword = 'password123';
    final tAuthResponse = AuthResponse(
      user: UserDto(
        username: tUsername,
        email: 'test@example.com',
        password: 'password123',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isActive: true,
        profile: UserProfile.USER.name, id: '',
      ),
      token: 'test-token',
    );

    test('should return AuthResponse when login is successful', () async {
      // arrange
      when(() => mockAuthRepository.login(
            AuthRequest(username: "", password: "")
          )).thenAnswer((_) async => tAuthResponse);

      // act
      // final result = await mockAuthRepository.execute(tUsername, tPassword);

      // assert
      expect({}, equals(tAuthResponse));
      verify(() => mockAuthRepository.login(
          AuthRequest(username: "", password: "")
      )).called(1);
    });

    test('should throw exception when login fails', () async {
      // arrange
      when(() => mockAuthRepository.login(
          AuthRequest(username: "", password: "")
      )).thenThrow(Exception('Invalid credentials'));

      // act & assert
    });
  });
}