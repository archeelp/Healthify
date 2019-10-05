
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String locationId;
  final String specialization;
  final String experience;
  final String contact;

  const Doctor(
      {@required this.name,
      @required this.locationId,
      @required this.specialization,
      this.contact, this.experience});
}