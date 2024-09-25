import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
void main() {
  runApp(const MyApp());
}