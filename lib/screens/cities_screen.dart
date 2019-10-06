import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import '../dummy.dart';
import '../widgets/city_item.dart';

class CityScreen extends StatelessWidget {
  static const routeName = '/city-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Color.fromRGBO(102, 153, 255, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: DUMMY_CITIES
              .map(
                (catData) => CityItem(
                  catData.id,
                  catData.title,
                  catData.imageUrl,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
