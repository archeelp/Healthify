import 'package:flutter/material.dart';

import '../screens/city_disease_screen.dart';

class CityItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CityItem(this.id, this.title, this.color);

  void selectCity(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CityDiseasesScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCity(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
