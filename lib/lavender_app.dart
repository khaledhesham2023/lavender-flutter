import 'package:flutter/material.dart';

class LavenderApp extends StatelessWidget {
  const LavenderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Hello, Lavender!'),
        ),
      ),
    );
  }
}
