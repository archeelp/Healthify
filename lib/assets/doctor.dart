import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String locationId;
  final String specialization;

  Doctor(
      {@required this.name,
      @required this.locationId,
      @required this.specialization});
}
