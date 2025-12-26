import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PartyMenuApp());
}

class PartyMenuApp extends StatelessWidget {
  const PartyMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Party Menu',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}
