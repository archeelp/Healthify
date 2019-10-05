import 'package:flutter/material.dart';

class DietAdvice extends StatefulWidget {
  static const routeName = '/diet_advice-screen';

  @override
  _DietAdviceState createState() => _DietAdviceState();
}

class _DietAdviceState extends State<DietAdvice> {
  String text_1 = 'Here are the tips you can follow to overcome your problem:';
  String text_2 = 'Hey!';

  Widget build(BuildContext context) {
    int diet_val = ModalRoute.of(context).settings.arguments;

    String show_text_1() {
      if (diet_val == 2) {
        return 'You are perfectly fine, Stay Healthy :)';
      } else {
        return text_1;
      }
    }

    String show_text_2() {
      if (diet_val == 2) {
        return 'How dare I give an advice to healthy ';
      } else {
        if (diet_val == 1) {
          text_2 =
              '1.Eat more frequently. \n 2.Choose nutrient-rich foods. \n 3.Try smoothies and shakes. \n 4.Watch when you drink. \n 5.Make every bite count. \n 6. Have an occasional treat. \n 7.Exercise';
        } else if (diet_val == 4) {
          text_2 =
              '1. Consume less “bad” fat and more “good” fat. \n 2.Consume less processed and sugary foods. \n 3.Eat more servings of vegetables and fruits. \n 4.Eat plenty of dietary fiber. \n 5. Focus on eating low–glycemic index foods. \n 6.Get the family involved in your journey. \n 7.Engage in regular aerobic activity. \n 8.Incorporate a weight training regimen. \n 9.Focus on reducing daily stress.';
        } else {
          text_2 =
              '1.Eat more fruit, vegetables, nuts, and whole grains. \n 2. Exercise, even moderately, for at least 30 minutes a day. \n 3.Cut down your consumption of fatty and sugary foods. \n 4. Use vegetable-based oils rather than animal-based fats.';
        }
        return text_2;
      }
    }

    print(diet_val);

    return Scaffold(
      appBar: AppBar(
        title: Text('Advice'),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Text(
              show_text_1(),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Text(
                  show_text_2(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}