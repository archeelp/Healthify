import 'package:flutter/material.dart';

class SymptomResult extends StatelessWidget {

  static const routeName = '/symptom-result';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}