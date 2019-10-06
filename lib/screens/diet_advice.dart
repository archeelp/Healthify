import 'package:flutter/material.dart';

class DietAdvice extends StatefulWidget {
  static const routeName = '/diet_advice-screen';

  @override
  _DietAdviceState createState() => _DietAdviceState();
}

class _DietAdviceState extends State<DietAdvice> {
  String text_1 = 'Here are the tips you can follow to overcome your problem:';
  String text_2 = 'Hey!';
  List list1 = [
    'Eat more frequently.',
    'Choose nutrient-rich foods.',
    'Try smoothies and shakes.',
    'Watch when you drink.',
    'Make every bite count.',
    'Have an occasional treat.',
    'Exercise'
  ];
  List list2 = [
    'Eat more fruit, vegetables, nuts, and whole grains.',
    'Exercise, even moderately, for at least 30 minutes a day.',
    'Cut down your consumption of fatty and sugary foods.',
    'Use vegetable-based oils rather than animal-based fats.'
  ];
  List list3 = [
    'Consume less “bad” fat and more “good” fat.',
    'Consume less processed and sugary foods.',
    'Eat more servings of vegetables and fruits.',
    'Eat plenty of dietary fiber.',
    'Focus on eating low–glycemic index foods.',
    'Get the family involved in your journey.',
    'Engage in regular aerobic activity.',
    'Incorporate a weight training regimen.',
    'Focus on reducing daily stress.'
  ];

  Widget build(BuildContext context) {
    int diet_val = ModalRoute.of(context).settings.arguments;

    ListTile show_text_1() {
      if (diet_val == 2) {
        return ListTile(
          title: Text('You are perfectly fine, Stay Healthy :)'),
        );
      } else {
        return ListTile(
          title: Text(
            text_1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        );
      }
    }

    Widget show_text_2() {
      if (diet_val == 2) {
        return ListView(
          children: <Widget>[
            ListTile(
              title: Text('How dare I give an advice to healthy '),
            )
          ],
        );
      } else {
        if (diet_val == 1) {
          return Container(

              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('#'+(index + 1).toString()),
                        backgroundColor: Color.fromRGBO(102, 153, 255, 1),
                      ),
                      title: Text(list1[index]),
                    ),
                  );
                },
                itemCount: list1.length,
              ));
        } else if (diet_val == 4) {
          return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('#'+
                          (index + 1).toString(),
                        ),
                        backgroundColor: Color.fromRGBO(102, 153, 255, 1),
                      ),
                      title: Text(list3[index]),
                    ),
                  );
                },
                itemCount: list3.length,
              ));
        } else {
          return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(list2[index]),
                    ),
                  );
                },
                itemCount: list2.length,
              ));
        }
      }
    }

    print(diet_val);

    return Scaffold(
      appBar: AppBar(
        title: Text('Advice'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            show_text_1(),
            Expanded(
              child: show_text_2(),
            )
          ],
        ),
      ),
    );
  }
}
