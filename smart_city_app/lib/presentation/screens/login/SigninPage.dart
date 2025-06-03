import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_city_app/core/constants/route.dart';
import 'package:smart_city_app/presentation/components/button_comp.dart';
import 'package:smart_city_app/presentation/kernel.dart';
import 'package:smart_city_app/presentation/screens/register/SignupPage.dart';

import '../../components/CustomPasswordField.dart';
import '../../components/CustomTextField.dart';
import '../../providers/authentication/auth_bloc.dart';
import '../disaster_statistic/disaster_statistic.dart';
import '../onboarding/color.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false; //

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Sign In';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Sign in to SmartCity',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome back! Please enter your details.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Champ Email utilisant CustomTextField
            CustomTextField(
              label: 'Email',
              hint: 'Enter your email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // Champ Mot de passe utilisant CustomPasswordField
            CustomPasswordField(
              label: 'Password',
              hint: 'Enter your password',
              controller: _passwordController,
            ),
            const SizedBox(height: 20),

            // Section "Remember Me" et "Forgot Password"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _rememberMe = newValue ?? false;
                          });
                        },
                        activeColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(color: Colors.grey[400]!, width: 1.5),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Remember Me',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Gérer l'action "Forgot Password"
                    log('Forgot Password cliqué!');
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red[700], // Couleur rouge pour le lien
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Bouton "Sign In" (sans CustomActionButton pour le moment)
            BlocConsumer<AuthBloc, AuthState>(
              listenWhen: (previous, current) {
                return previous != current &&
                    ModalRoute.of(context)?.settings.name ==
                        RoutesPath.signin.path.replaceAll('/', '');
              },
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  authenticated: (state) {
                    context.push(RoutesPath.home.path);
                  },
                  failure: (state) {
                    if (context.mounted && state.failure != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.failure.toString()),
                          duration: const Duration(seconds: 4),
                          action: SnackBarAction(
                            label: 'Dismiss',
                            onPressed: () {
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentSnackBar();
                            },
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => ButtonComp(
                    width: double.infinity,
                    title: title,
                    onPressed: login,
                  ),
                  loading: () => ButtonComp(
                    title: title,
                    onPressed: () {},
                    isLoading: true,
                  ),
                );
              },
            ),

            const SizedBox(height: 75),

            // Section "Don't have an account? Sign Up"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                GestureDetector(
                  onTap: () {
                    // Naviguer vers la page d'inscription
                    context.push(RoutesPath.signup.path);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    log('Sign In cliqué!');
    log('Email: $email');
    log('Password: $password');
    log('Remember Me: $_rememberMe');

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }
    ;
    context.read<AuthBloc>().add(
      AuthEvent.login(email: email, password: password),
    );
    // Logique d'authentification ici
  }
}
