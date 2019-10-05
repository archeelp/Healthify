import 'package:app/widgets/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/doctor.dart';
import 'dart:convert';

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
  var cityId;
  final doctorList = [];
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      cityTitle = routeArgs['title'];
      cityId = routeArgs['id'];
      diplayedDoc = widget.doctors.where((doc) {
        return doc.locationId.contains(cityId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  Future<void> fetchAndSetProducts() async {
    final url = 'http://c55b1289.ngrok.io/' + cityTitle;
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, List<String>>;
      for(int i = 0; i < extractedData["names"].length; i++) {
        var tempDoc = Doctor(
          exp: extractedData["exp"][i],
          name: extractedData["name"][i],
          specialization: extractedData["q"][i],
          locationId: cityId,
          contact: "9987570286"
        );
        doctorList.add(tempDoc);
      }
    } catch (error) {
      throw (error);
    }
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
