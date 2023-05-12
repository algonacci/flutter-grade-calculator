import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Constants.title,
          style: Constants.textStyle,
        ),
      ),
      body: Text('Hello'),
    );
  }
}
