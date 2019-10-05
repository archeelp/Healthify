import 'package:flutter/material.dart';

class Diet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Diet Sector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            DropDownButtonCreate(),
            CreateText(),
            CreateButton(),
          ],
        )
      )
    );
  }

}

class CreateText extends StatefulWidget {
  @override
  _CreateTextState createState() => _CreateTextState();
}

class _CreateTextState extends State<CreateText> {
  static int weight,height;
  @override
  void initState() {
    super.initState();
    weight = 0;
    height = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Enter your weight(KGs):',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            TextField(
              onChanged: (text){
                weight = int.parse(text);
              },
            ),
            Text(
              'Enter your height(m):',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            TextField(
              onChanged: (text){
                height = int.parse(text);
              },
            )
          ],
        ),
      ],
    );
  }
}

class DropDownButtonCreate extends StatefulWidget {
  @override
  _DropDownButtonCreateState createState() => _DropDownButtonCreateState();
}

class _DropDownButtonCreateState extends State<DropDownButtonCreate> {
  static String dropdownValue='male';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: dropdownValue,
        style: TextStyle(
          color: Colors.deepPurple
        ),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['male','female']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
          .toList(),
    );
  }
}

class CreateButton extends StatefulWidget {
  @override
  _CreateButtonState createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  static String result,score;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Calculate BMI'),
      onPressed:(){
        CalculateResult();
        OpenActionBar();
      }
    );
  }
  void CalculateResult(){
    score = (_CreateTextState.weight/(_CreateTextState.height*_CreateTextState.height)).toString();
    int iScore = int.parse(score);
    if( _DropDownButtonCreateState.dropdownValue == 'male'){
      if(iScore < 19){
        result = 'Underweight';
      }else if(iScore < 25 ){
        result = 'Normal';
      }else if(iScore < 30){
        result = 'Overweight';
      }else result = 'Obesity';
    }else{
      if(iScore < 17){
        result = 'Underweight';
      }else if(iScore < 22 ){
        result = 'Normal';
      }else if(iScore < 28){
        result = 'Overweight';
      }else result = 'Obesity';
    }
  }
  void OpenActionBar(){
    Widget okButton = FlatButton(
      child: Text('OK'),
      onPressed: (){
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
    title: Text('Your BMI Result'),
    content: Text('Your Score is ${score} and you have been found to be ${result}'),
     actions: <Widget>[
       okButton,
     ],         
  );

  showDialog(
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );
  }
  
}
