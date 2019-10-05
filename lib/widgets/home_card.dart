import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String cardText;
  final String imagePath;

  HomeCard({@required this.cardText, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        height: 200,
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,

                ),
              ),
              Positioned(
                bottom: 70,
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
                    style: TextStyle(color: Colors.white, fontSize: 24,),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
