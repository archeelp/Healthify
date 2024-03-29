import 'package:Healthify/screens/about_us.dart';
import 'package:Healthify/screens/cities_screen.dart';
import 'package:Healthify/screens/city_disease_screen.dart';
import 'package:Healthify/screens/diet_advice.dart';
import 'package:Healthify/screens/disease_detail_screen.dart';
import 'package:Healthify/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/symptom_screen.dart';
import './screens/symptom_result.dart';
import 'package:Healthify/dummy.dart';
import './screens/diet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthify',
        home: HomeScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
          appBarTheme: AppBarTheme(color: Color.fromRGBO(102, 153, 255, 1)),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          SymptomScreen.routeName: (ctx) => SymptomScreen(),
          SymptomResult.routeName: (ctx) => SymptomResult(),
          CityScreen.routeName: (ctx) => CityScreen(),
          CityDiseasesScreen.routeName: (ctx) =>
              CityDiseasesScreen(DUMMY_DISEASES),
          Diet.routeName: (ctx) => Diet(),
          DiseaseDetailScreen.routeName: (ctx) => DiseaseDetailScreen(),
          TabScreen.routeName: (ctx) => TabScreen(),
          DietAdvice.routeName: (ctx) => DietAdvice(),
          AboutUs.routeName: (ctx) => AboutUs(),
        });
  }
}
