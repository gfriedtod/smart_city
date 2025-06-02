// Fichier : lib/widgets/custom_text_field.dart (chemin suggéré)
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller; // Pour récupérer la valeur du champ
  final TextInputType keyboardType;
  final bool? isPassword;
  final bool readOnly;
  final bool
  obscureText; // Pour des cas où un CustomTextField doit être obscurci

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.obscureText = false,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            readOnly: readOnly,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w100,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
