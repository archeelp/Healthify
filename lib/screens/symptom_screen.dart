// import 'package:app/widgets/symptom_item.dart';
import 'package:flutter/material.dart';
import './symptom_result.dart';
// import 'package:app/ask.dart';

class SymptomScreen extends StatefulWidget {

  static const routeName = '/symptom';


  @override
  _SymptomScreenState createState() => _SymptomScreenState();
}

class _SymptomScreenState extends State<SymptomScreen> {
  int questionIndex = 0;
  final symptomController = TextEditingController();
  List<String> symptomsAdded = [];

  void addSymptom() {
    if (symptomController.text.isEmpty) {
      return;
    }
    setState(() => symptomsAdded.add(symptomController.text));
    symptomController.clear();
  }

  void submitSymptoms() {
    if (symptomsAdded.isNotEmpty) {
      Navigator.of(context).pushNamed(
        SymptomResult.routeName,
        arguments: {},
      );
    }
  }

  Widget showAddedSymptoms() {
    if (symptomsAdded.isEmpty) {
      return Text("");
    } else {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "\n\nSymptoms you have added:",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            ...(symptomsAdded as List<String>).map((symptom) {
              return Container(
                height: 40,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 2),
                width: double.infinity,
                child: Card(
                  child: Text("$symptom"),
                ),
              );
            }).toList()
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Symptom Screen",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: symptomController,
                      decoration: InputDecoration(
                        labelText: "Enter a symptom",
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => addSymptom(),
                          child: Text("Add symptom"),
                        ),
                        RaisedButton(
                          onPressed: () => submitSymptoms(),
                          child: Text("Submit"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          showAddedSymptoms(),
        ],
      ),
    );
  }
}






