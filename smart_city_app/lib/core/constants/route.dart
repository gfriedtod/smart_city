import 'dart:convert';
import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:smart_city_app/domain/dto/AuthResponse.dart';
import 'package:smart_city_app/presentation/kernel.dart';
import 'package:smart_city_app/presentation/screens/home/HomePage.dart';
import 'package:smart_city_app/presentation/screens/login/SigninPage.dart';
import 'package:smart_city_app/presentation/screens/onboarding/onboardinpage.dart';
import 'package:smart_city_app/presentation/screens/register/SignupPage.dart';

import '../../presentation/screens/profile/ProfilePage.dart';

enum RoutesPath {
  root('/'),
  home('/home'),
  signup('/signup'),
  signin('/signin'),
  profile('/profile'),
  onboarding('/onboarding');

  final String path;

  const RoutesPath(this.path);
}

final router = GoRouter(
  initialLocation: RoutesPath.root.path,
  routes: [
    GoRoute(
      name: 'home',
      path: RoutesPath.root.path,
      builder: (context, state) => KernelView(),
      redirect: (context, state) {
        final userString = localStorage.getItem('user');
        if (userString == null) return RoutesPath.onboarding.path;

        final user = AuthResponse.fromJson(jsonDecode(userString));
        if (!isTokenExpired(user.token)) {
          return RoutesPath.home.path;
        }
        return RoutesPath.onboarding.path;
      },
    ),
    GoRoute(
      path: RoutesPath.home.path,
      builder: (context, state) => KernelView(),
    ),
    GoRoute(
      name: 'signup',
      path: RoutesPath.signup.path,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      name: 'signin',
      path: RoutesPath.signin.path,
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      name: 'profile',
      path: RoutesPath.profile.path,
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: RoutesPath.onboarding.path,
      builder: (context, state) => OnboardingPage(),
    ),
  ],
);

bool isTokenExpired(String? token) {
  try {
    // Get the token and extract the payload part
    String payloadBase64 = token!.split('.')[1];

    // Add padding to the base64 string if necessary
    int paddingLength = payloadBase64.length % 4;
    if (paddingLength > 0) {
      payloadBase64 += '=' * (4 - paddingLength);
    }

    // Decode the base64Url payload
    String payloadJson = utf8.decode(base64Url.decode(payloadBase64));

    // Parse the payload JSON
    Map<String, dynamic> payload = jsonDecode(payloadJson);

    // Get the `iat` value (issued at time in seconds since epoch)
    int exp = payload['exp'];

    // Define the token expiration duration (e.g., 1 hour in seconds)
    int expirationDurationInSeconds = 3600;

    // Calculate the expiration time
    int expirationTime = exp + expirationDurationInSeconds;

    // Get the current time in seconds since epoch
    int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    // Check if the token is expired
    return currentTime > expirationTime;
  } catch (e) {
    log(e.toString());
    return true; // Assume token is expired if there's an error
  }
}
