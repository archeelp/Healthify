import 'dart:convert';

import 'package:app/symptom_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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
  String result,result1;

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
    String url = 'http://da5eeaae.ngrok.io/predict/' + s(SymptomResult.symptoms) ;
    try {
      final response = await http.get(url);
      print(response.body);
      setState(() {
        final Map<String, dynamic> extractedData =
            jsonDecode(response.body) as Map<String, dynamic>;

        result = extractedData['data'];
      });
    } catch (error) {
      throw (error);
    }

    url = 'http://da5eeaae.ngrok.io/disease/' + result ;
    try {
      final response = await http.get(url);
      print(response.body);
      setState(() {
        final Map<String, dynamic> extractedData =
        jsonDecode(response.body) as Map<String, dynamic>;

        result1 = extractedData['para'];
        print(result1);
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
      body: Container(
          color: Colors.lightGreenAccent,
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: Card(
            elevation: 10,
            child: Container(
              height: 300,
              child: Column(
                children: <Widget>[
                  Center(
                    child: result != null ? Text(
                      "You may have " +
                          result +
                          ". Please visit the clinic if needed",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                      textAlign: TextAlign.center,
                    ) : Text(''),
                  ),
                  Container(
                    height: 200,
                    child: ListView(children: <Widget>[
                      result1 == null ? Text(''):Text(result1),
                    ],),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
