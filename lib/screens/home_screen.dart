import 'package:flutter/material.dart';
import 'package:app/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      //drawer: ,
      body: ListView(
        children: <Widget>[
          HomeCard(
            cardText: 'Symptoms Based Disease Prediction',
          ),
          HomeCard(
            cardText: 'Location Based Disease Prediction',
          ),
          HomeCard(
            cardText: 'Diet Prediction',
          ),
        ],
      ),
    );
  }
}
