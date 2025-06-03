import 'package:flutter/material.dart';

import '../screens/onboarding/color.dart';

class ButtonComp extends StatelessWidget {
   ButtonComp({
    super.key,
    this.width,
    required this.title,
    required this.onPressed,
    this.isLoading,
  });

  final double? width;
  final String title;
  final VoidCallback onPressed;
   bool? isLoading;

  @override
  Widget build(BuildContext context) {
    isLoading = isLoading ?? false;
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
        child: (isLoading!)
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 5,
              )
            : Text(
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
