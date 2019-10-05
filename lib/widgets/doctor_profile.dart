import 'package:app/models/doctor.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {

  final Doctor doc;

  DoctorProfile(this.doc);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
        Text(doc.name),
        Text(doc.specialization),
        Text(doc.exp),
        Text(doc.contact),
    ],),
      ),);
  }
}
