import 'package:flutter/material.dart';
import 'screens/input_page.dart';

// Flutter application entry point.
void main() => runApp(const BmiApp());

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'BMI Calculator',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF101424),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFF18C9A),
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF101424)),
    ),
    home: const InputPage(),
  );
}
