import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home')
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
            ),
            HomeCard(
              cardText: 'Location Based Disease Prediction',
              imagePath: 'lib/assets/images.jpeg',
            ),
            HomeCard(
              cardText: 'Diet Prediction',
              imagePath: 'lib/assets/images.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}