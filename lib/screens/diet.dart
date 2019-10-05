import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  static const routeName = '/diet-screen';

  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  static double weight, height;
  static String dropdownValue = 'male';
  static String result,modify_s = 'Let\'s see your result';
  static double score;


  TextEditingController weightEditingController = TextEditingController();
  TextEditingController heightEditingController = TextEditingController();

  void setText(val) {
    setState(() {
      modify_s = val;
    });
  }

  void CalculateResult() {
    score = (weight / (height * height));
    int iScore = score.floor();
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
        appBar: AppBar(title: Text('BMI Calculator'),),
        body: Column(children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            style: TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.black,
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
          TextField(
            decoration: InputDecoration(labelText: 'Enter Weight'),
            controller: weightEditingController,
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(labelText: 'Enter Height'),
            controller: heightEditingController,
          ),
          SizedBox(height: 10,),
          RaisedButton(
              child: Text('Calculate BMI'),
              onPressed: () {
                weight = double.parse(weightEditingController.text);
                height = double.parse(heightEditingController.text);
                CalculateResult();
                setText(result);
              }),
          SizedBox(height: 10,),
          Text(modify_s)],
            ));
  }
}
