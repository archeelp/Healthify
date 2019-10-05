import 'package:flutter/material.dart';

import '../models/disease.dart';
import '../widgets/disease_item.dart';

class CityDiseasesScreen extends StatefulWidget {
  static const routeName = '/city-diseases';

  final List<Disease> disease;

  CityDiseasesScreen(this.disease);

  @override
  _CityDiseasesScreenState createState() => _CityDiseasesScreenState();
}

class _CityDiseasesScreenState extends State<CityDiseasesScreen> {
  String cityTitle;
  List<Disease> displayedDisease;
  var _loadedInitData = false;


  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      cityTitle = routeArgs['title'];
      final cityId = routeArgs['id'];
      displayedDisease = widget.disease.where((dis) {
        return dis.cities.contains(cityId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return DiseaseItem(
            id: displayedDisease[index].id,
            title: displayedDisease[index].title,
            imageUrl: displayedDisease[index].imageUrl,
            duration: displayedDisease[index].duration,
            symptoms: displayedDisease[index].symptoms,
            cure: displayedDisease[index].cure,
          );
        },
        itemCount: displayedDisease.length,
      ),
    );
  }
}
