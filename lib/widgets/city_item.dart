import 'package:Healthify/screens/tab_screen.dart';
import 'package:flutter/material.dart';


class CityItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CityItem(this.id, this.title, this.imageUrl);

  void selectCity(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      TabScreen.routeName,
      arguments: {
        'title': title,
        'id': id,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCity(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
