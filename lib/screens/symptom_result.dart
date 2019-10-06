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
  String result, result1;
  var isLoading = true;

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
    res = res.substring(0, res.length - 1);
    return res;
  }

  void initState() {
    fetchAndSetProducts();
  }

  Future<void> fetchAndSetProducts() async {
    String url =
        'http://da5eeaae.ngrok.io/predict/' + s(SymptomResult.symptoms);
    try {
      final response = await http.get(url);
      isLoading = true;
      print(response.body);
      setState(() {
        final Map<String, dynamic> extractedData =
            jsonDecode(response.body) as Map<String, dynamic>;

        result = extractedData['data'];
      });
    } catch (error) {
      throw (error);
    }

    url = 'http://da5eeaae.ngrok.io/disease/' + result;
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
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(102, 153, 255, 1),
          title: Text(
            "Result",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Card(
                          color: Color.fromRGBO(102, 153, 255, 1),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            child: Text(
                              result == null ? '' : result,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Card(
                          color: Color.fromRGBO(102, 153, 255, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              result1 == null ? '' : result1,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
