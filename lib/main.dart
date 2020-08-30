import 'package:avances/pages/AdvancesScreen.dart';
import 'package:avances/pages/Home.dart';
import 'package:avances/pages/Home1.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
