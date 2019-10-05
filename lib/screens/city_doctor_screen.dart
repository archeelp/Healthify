import 'package:app/widgets/doctor_profile.dart';
import 'package:flutter/material.dart';

import '../models/doctor.dart';

class CityDoctorScreen extends StatefulWidget {
  final List<Doctor> doctors;

  CityDoctorScreen(this.doctors);

  @override
  CityDoctorScreenState createState() => CityDoctorScreenState();
}

class CityDoctorScreenState extends State<CityDoctorScreen> {
  String cityTitle;
  List<Doctor> diplayedDoc;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      cityTitle = routeArgs['title'];
      final cityId = routeArgs['id'];
      diplayedDoc = widget.doctors.where((doc) {
        return doc.locationId.contains(cityId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return DoctorProfile(diplayedDoc[index].name);
        },
        itemCount: diplayedDoc.length,
      ),
    );
    ;
  }
}
