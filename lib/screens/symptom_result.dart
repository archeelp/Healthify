import 'dart:convert';

import 'package:app/symptom_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './symptoms_result_2.dart';

class SymptomResult extends StatefulWidget {
  static const routeName = '/symptom-result';
  static List<String> symptoms;

  @override
  _SymptomResultState createState() => _SymptomResultState();
}

class _SymptomResultState extends State<SymptomResult> {
  final List<SymptomQuestionPair> selectedQuestions = symptomQuestions;
  int questionIndex = 0;
  List<String> options = [];
  String result;

  void questionAnswered(String option) {
    if (questionIndex < selectedQuestions.length) {
      options.add(option);
      setState(() {
        questionIndex++;
      });
    }
  }

  String s(List<String> l) {
    String res = "";
    for (var x in l) {
      res += x + ',';
    }
    res = res.substring(0, res.length - 1 );
    return res;
  }

  void initState() {
    fetchAndSetProducts();
  }

  Future<void> fetchAndSetProducts() async {

//    print(CityDoctorScreen.cityTitle['title']);
    final url = 'http://c55b1289.ngrok.io/predict/' + s(SymptomResult.symptoms) ;
    try {
      final response = await http.get(url);
      print(response.body);
      setState(() {
        final Map<String, dynamic> extractedData =
            jsonDecode(response.body) as Map<String, dynamic>;
//        for (int i = 0; i < extractedData.length; i++) {
//          exp.add(extractedData[i.toString()]['exp']);
//          name.add(extractedData[i.toString()]['name']);
//          q.add(extractedData[i.toString()]['q']);
//        }
        result = extractedData['data'];
      });
    } catch (error) {
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.lightGreenAccent,
          margin: EdgeInsets.all(10),
          height: 200,
          width: double.infinity,
          child: Card(
            elevation: 10,
            child: Center(
              child: Text(
                "You may have " +
                    result +
                    ". Please visit the clinic if needed",
                style: TextStyle(
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
