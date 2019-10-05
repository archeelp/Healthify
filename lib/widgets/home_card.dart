import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String cardText;
  final String imagePath;
  final String goToRoute;

  HomeCard(
      {@required this.cardText,
      @required this.imagePath,
      @required this.goToRoute});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(goToRoute),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15)
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                top: 50,
                right: 0,
                left: 0,
                child: Container(
                  height: 70,
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  color: Colors.black54,
                  child: Text(
                    cardText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
