import 'package:app/symptom_data.dart';
import 'package:flutter/material.dart';
import './symptoms_result_2.dart';

class SymptomResult extends StatefulWidget {
  static const routeName = '/symptom-result';
  @override
  _SymptomResultState createState() => _SymptomResultState();
}

class _SymptomResultState extends State<SymptomResult> {
  final List<SymptomQuestionPair> selectedQuestions = symptomQuestions;
  int questionIndex = 0;
  List<String> options = [];
  void questionAnswered(String option) {
    if (questionIndex < selectedQuestions.length) {
      options.add(option);
      setState(() {
        questionIndex++;
      });
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
      body: questionIndex < selectedQuestions.length
          ? Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Text(
                    "${selectedQuestions[questionIndex].question}",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ...(selectedQuestions[questionIndex].options as List<String>)
                      .map((option) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 30,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: RaisedButton(
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () => questionAnswered(option),
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ));
                  }).toList()
                ],
              ),
            )
          : SymptomFinal(),
    );
  }
}
