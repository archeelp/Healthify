import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {

  final String name;

  DoctorProfile(this.name);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(name),
    );
  }
}
