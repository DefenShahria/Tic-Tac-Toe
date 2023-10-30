import 'package:flutter/material.dart';
import 'package:wise/ui/homepage.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomePage(),
    );
  }
}
