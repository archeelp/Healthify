import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import './symptom_result.dart';

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
      Navigator.of(context).pushReplacementNamed(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "\n\nSymptoms you have added:\n",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ...(symptomsAdded as List<String>).map((symptom) {
                return ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => setState(
                      () => symptomsAdded.removeWhere((s) {
                        return s == symptom;
                      }),
                    ),
                  ),
                  title: Text("$symptom"),
                );
              }).toList(),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Symptom Screen",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
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
                      SizedBox(
                        height: 10,
                      ),
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
        ),
      ),
    );
  }
}
