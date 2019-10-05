import 'package:app/screens/cities_screen.dart';
import 'package:app/screens/city_disease_screen.dart';
import 'package:app/screens/diet_advice.dart';
import 'package:app/screens/disease_detail_screen.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/symptom_screen.dart';
import './screens/symptom_result.dart';
import 'package:app/dummy.dart';
import './screens/diet.dart';

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
        accentColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SymptomScreen.routeName: (ctx)=> SymptomScreen(),
        SymptomResult.routeName: (ctx)=> SymptomResult(),
        CityScreen.routeName: (ctx) => CityScreen(),
        CityDiseasesScreen.routeName: (ctx) => CityDiseasesScreen(DUMMY_DISEASES),
        Diet.routeName: (ctx) => Diet(),
        DiseaseDetailScreen.routeName: (ctx) => DiseaseDetailScreen(),
        TabScreen.routeName: (ctx) => TabScreen(),
        DietAdvice.routeName: (ctx) => DietAdvice(),
      }
    );
  }
}