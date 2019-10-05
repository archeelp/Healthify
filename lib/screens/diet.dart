import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  static const routeName = '/diet-screen';

  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  static int weight, height;
  static String dropdownValue = 'male';
  static String result, score, modify_s='Let\'s see your result';
  
  void setText(val){
    setState(() {
     modify_s = val; 
    });
  }

  void CalculateResult() {
    score = (weight / (height * height)).toString();
    int iScore = int.parse(score);
    if (dropdownValue == 'male') {
      if (iScore < 19) {
        result = 'Underweight';
      } else if (iScore < 25) {
        result = 'Normal';
      } else if (iScore < 30) {
        result = 'Overweight';
      } else
        result = 'Obesity';
    } else {
      if (iScore < 17) {
        result = 'Underweight';
      } else if (iScore < 22) {
        result = 'Normal';
      } else if (iScore < 28) {
        result = 'Overweight';
      } else
        result = 'Obesity';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      DropdownButton<String>(
        value: dropdownValue,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['male', 'female']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Enter your weight(KGs):',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextField(
                onChanged: (text) {
                  weight = int.parse(text);
                },
              ),
              Text(
                'Enter your height(m):',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextField(
                onChanged: (text) {
                  height = int.parse(text);
                },
              )
            ],
          ),
        ],
      ),
      RaisedButton(
          child: Text('Calculate BMI'),
          onPressed: () {
            CalculateResult();
            setText(result);
          }),
          Column(
            children: <Widget>[
              Text(modify_s),
            ],
          )
    ]));
  }
}
