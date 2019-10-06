
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WHAT WE DO AND WHO WE ARE'
        ) ,
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.tealAccent,
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: Text(
              'Welcome! to healthify app. This app aims to make the people aware of the TRENDING DISEASES in their locality and if they have been found having symptoms of that diesase, then the app lists out the doctors available in their locality. Also, it helps to calculate BMI and get the health advices.'
            ),
          ),
          Card(
            color: Colors.tealAccent,
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  'We are the students of V.J.T.I. College pursuing their S.Y.B.TECH(CS)'
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Developers:'
                    ),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Saif Kazi'
                      ),
                    ),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Archeel Parekh'
                      ),
                    ),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Yogesh Deshpande'
                      ),
                    ),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Yash Tailor'
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}

