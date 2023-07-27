import 'package:flutter/material.dart';
import 'package:mile_two/screens/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Application',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 65, 0, 243),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.grey[900], // Change the background color of the alert dialog
          titleTextStyle: TextStyle(color: Colors.white), // Change the text color of the alert title
          contentTextStyle: TextStyle(color: Colors.white), // Change the text color of the alert content
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Change the border radius of the alert dialog
          ),
        ),
      ),
      home: MovieScreen(),
    );
  }
}
