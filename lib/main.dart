import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/symptom_screen.dart';
import './screens/symptom_result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        secondaryHeaderColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SymptomScreen.routeName: (ctx)=> SymptomScreen(),
        SymptomResult.routeName: (ctx)=> SymptomResult(),
      }
    );
  }
}