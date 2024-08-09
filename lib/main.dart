import 'package:flutter/material.dart';
import 'package:weather_app_with_api/screen/end_page.dart';
import 'package:weather_app_with_api/screen/first_page.dart';
import 'package:weather_app_with_api/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          
          backgroundColor: Colors.transparent,
  
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: Color(0xFF676BD0),
          ),
        useMaterial3: true,
      ),
      home:startPage(),
    );
  }
}

