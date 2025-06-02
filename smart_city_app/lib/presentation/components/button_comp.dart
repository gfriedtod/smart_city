import 'package:flutter/material.dart';

import '../screens/onboarding/color.dart';

class ButtonComp extends StatelessWidget {
  const ButtonComp({
    super.key,
     this.width,
    required this.title,
    required this.onPressed,
  });

  final double? width;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Couleur de fond du bouton
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Coins arrondis
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
