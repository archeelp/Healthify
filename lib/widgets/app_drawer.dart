import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 100,
              width: double.infinity,
              child: Image.asset(
            'lib/assets/health_sign-2-512.png',
                fit: BoxFit.fill,
          )),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.local_hotel),
              title: Text(
                'Symptoms Based Disease Prediction',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text(
                'Location Based Disease Prediction',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.fastfood),
              title: Text(
                'Diet Prediction',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
