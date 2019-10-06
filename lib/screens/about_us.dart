import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 35,right: 20,left: 20,bottom: 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromRGBO(102, 153, 255, 1),
            Color.fromRGBO(174, 214, 241, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.6],
        )),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Welcome! to healthify app. This app aims to make the people aware of the TRENDING DISEASES in their locality and if they have been found having symptoms of that diesase, then the app lists out the doctors available in their locality. Also, it helps to calculate BMI and get the health advices.',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'We are the students of V.J.T.I. College pursuing their S.Y.B.TECH(CS)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Developers:',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Saif Kazi',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Archeel Parekh',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Yogesh Deshpande',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Yash Tailor',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
