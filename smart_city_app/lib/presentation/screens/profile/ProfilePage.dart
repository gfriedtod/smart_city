import 'package:flutter/material.dart';
import 'package:smart_city_app/presentation/components/CustomTextField.dart';
import 'package:smart_city_app/presentation/components/button_comp.dart';
import 'package:smart_city_app/presentation/screens/onboarding/color.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_app/presentation/screens/home/HomePage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Colors.green.shade800;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },

        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFEDE6FF), // fond violet clair
            child: Icon(Icons.person, size: 50, color: Colors.deepPurple),
          ),
          const SizedBox(height: 30),

          // Formulaire dans une box stylisée
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.edit_note, size: 28),
                    SizedBox(width: 8),
                    Text(
                      "Modifier",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _InputField(label: "Nom"),
                const _InputField(label: "Prenom"),
                const _InputField(label: "email"),
                const _InputField(label: "Phone number"),
                const SizedBox(height: 12),
                Text("plus de paramètres", style: TextStyle(color: Colors.grey.shade600)),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Action de déconnexion
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    "Se deconnecter",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  const _InputField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
