import 'package:flutter/material.dart';
import 'Portrait.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget with PortraitMode {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1D1E33),
        scaffoldBackgroundColor: Color(0xFF1D1E33),
      ),
      home: InputPage(),
//      routes: {
//        '/main': (context) => InputPage(),
//      },
    );
  }
}
