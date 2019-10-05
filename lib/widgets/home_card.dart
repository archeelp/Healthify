import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String cardText;

  HomeCard({@required this.cardText});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(15),
        height: 200,
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              cardText,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
