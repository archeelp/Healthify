import 'package:app/screens/cities_screen.dart';
import 'package:app/screens/symptom_screen.dart';
import 'package:flutter/material.dart';
import '../screens/diet.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                'android/app/src/main/res/drawable/splash_icon.png',
                fit: BoxFit.fill,
              )),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SymptomScreen.routeName);
              },
              leading: Icon(Icons.local_hotel),
              title: Text(
                'Symptoms Based Disease Prediction',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(CityScreen.routeName);
              },
              leading: Icon(Icons.local_hospital),
              title: Text(
                'Location Based Disease Prediction',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(Diet.routeName);
              },
              leading: Icon(Icons.fastfood),
              title: Text(
                'Diet Prediction',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
