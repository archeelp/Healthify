import 'package:app/screens/cities_screen.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/home_card.dart';
import './symptom_screen.dart';
import './diet.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home'),
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (_)=> [
                  PopupMenuItem(
                    child: Text('Sign Up'),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text('Sign In'),
                    value: 0,
                  ),
                ],
              )
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            HomeCard(
              cardText: 'Symptoms Based Disease Prediction',
              imagePath: 'lib/assets/images.jpeg',
              goToRoute: SymptomScreen.routeName,
            ),
            HomeCard(
              cardText: 'Location Based Disease Prediction',
              imagePath: 'lib/assets/Screenshot 2019-10-05 at 16.11.47.png',
              goToRoute: CityScreen.routeName,
            ),
            HomeCard(
              cardText: 'Diet Prediction',
              imagePath: 'lib/assets/590825882-H.jpg',
              goToRoute: Diet.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
