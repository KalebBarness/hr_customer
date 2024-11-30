import 'package:flutter/material.dart';
import 'package:hp_customer/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Text selection theme
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color.fromARGB(255, 202, 202, 198), // Custom selected text highlight color
          cursorColor: Color.fromARGB(255, 0, 0, 0), // Cursor color when typing
          selectionHandleColor: Colors.orange, // Color of the text selection handles
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 155, 154, 154)), // Default label color
          floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 62, 62, 62)), // Label color when focused
        ),
      ),
      home: const HomePage(
      ),
    );
  } 
}


