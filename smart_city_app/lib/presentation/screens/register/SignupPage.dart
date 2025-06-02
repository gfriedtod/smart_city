import 'package:flutter/material.dart';
import 'package:smart_city_app/presentation/components/button_comp.dart';
import 'package:smart_city_app/presentation/screens/onboarding/color.dart';

import '../../components/CustomPasswordField.dart';
import '../../components/CustomTextField.dart';
import '../login/SigninPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'Please fill the following form',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Nom Complet',
              hint: 'Bradley Wilkinson',
              controller: _fullNameController,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Email',
              hint: 'bradley_walk@example.com',
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            CustomPasswordField(
              label: 'Mot de passe',
              hint: 'Entrez votre mot de passe',
              controller: _passwordController,
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black54),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'En vous inscrivant, vous acceptez nos ',
                  ),
                  TextSpan(
                    text: 'Conditions d\'utilisation',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    // Vous pouvez ajouter une action onTap ici pour naviguer vers les conditions
                  ),
                  const TextSpan(text: ' et notre '),
                  TextSpan(
                    text: 'Politique de confidentialité',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    // Vous pouvez ajouter une action onTap ici pour naviguer vers la politique
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ButtonComp(
                width: double.infinity,
                title: 'Sign Up',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Vous avez déjà un compte ? ',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
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
}
