import 'package:app/screens/diet_advice.dart';
import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  static const routeName = '/diet-screen';

  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  static double weight, height;
  static String dropdownValue = 'Male';
  static String result, modify_s = 'Let\'s see your result';
  static double score;
  int val;

  TextEditingController weightEditingController = TextEditingController();
  TextEditingController heightEditingController = TextEditingController();

  void setText(val) {
    setState(() {
      print(val);
      modify_s = val;
    });
  }

  void CalculateResult() {
    score = (weight / (height * height));
    int iScore = score.floor();
    print('iscore');
    print(iScore);
    if (dropdownValue == 'Male') {
      if (iScore < 19) {
        result = 'Underweight';
        setState(() {
          val = 1;
        });
      } else if (iScore < 25) {
        result = 'Normal';
        setState(() {
          val = 2;
        });
      } else if (iScore < 30) {
        result = 'Overweight';
        setState(() {
          val = 3;
        });
      } else {
        result = 'Obesity';
        setState(() {
          val = 4;
        });
      }
    } else {
      if (iScore < 17) {
        result = 'Underweight';
        setState(() {
          val = 1;
        });
      } else if (iScore < 22) {
        result = 'Normal';
        setState(() {
          val = 2;
        });
      } else if (iScore < 28) {
        result = 'Overweight';
        setState(() {
          val = 3;
        });
      } else
        result = 'Obesity';
      setState(() {
        val = 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Please Select Your Gender',
                    style: TextStyle(fontSize: 18),
                  ),
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
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter Weight'),
                controller: weightEditingController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter Height'),
                controller: heightEditingController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Text('Calculate BMI'),
                onPressed: () {
                  weight = double.parse(weightEditingController.text);
                  height = double.parse(heightEditingController.text);
                  CalculateResult();
                  setText(result);
                }),
            SizedBox(
              height: 10,
            ),
            Text(modify_s)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(DietAdvice.routeName, arguments: val);
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
