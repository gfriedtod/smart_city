import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:smart_city_app/core/constants/route.dart';
import 'package:smart_city_app/domain/dto/AuthResponse.dart';
import 'package:smart_city_app/presentation/components/CustomTextField.dart';
import 'package:smart_city_app/presentation/components/button_comp.dart';
import 'package:smart_city_app/presentation/screens/onboarding/color.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = AuthResponse.fromJson(jsonDecode(localStorage.getItem('user')!)).user;
    _nameController.text = user?.username ?? '';
    _emailController.text = user?.email ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                const CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        // TODO: Navigate to edit profile or enable editing
                        print("Edit profile tapped");
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Name",
              hint: "Name",
              controller: _nameController,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Email",
              hint: "Email Address",
              controller: _emailController,
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            ButtonComp(
              width: double.infinity,
              title: 'update',
              onPressed: () {
                localStorage.clear();
                context.pushReplacement(RoutesPath.signin.path);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildInfoValue(String text) {
    return CustomTextField(label: text, hint: text);
  }
}
