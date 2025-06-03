import 'package:flutter/material.dart';
import 'package:smart_city_app/presentation/kernel.dart';
import 'package:smart_city_app/presentation/screens/onboarding/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Smart City App', // Titre mis à jour
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontFamily: 'EinaBold'),
          bodyMedium: TextStyle(color: Colors.black, fontFamily: 'Eina'),
          bodySmall: TextStyle(color: Colors.black, fontFamily: 'Eina'),
        ),
      ),
      debugShowCheckedModeBanner: false, // debug off
      home: KernelView(),
    );
  }
}