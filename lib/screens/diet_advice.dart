import 'package:flutter/material.dart';

class DietAdvice extends StatefulWidget {
  static const routeName = '/diet_advice-screen';

  @override
  _DietAdviceState createState() => _DietAdviceState();
}

class _DietAdviceState extends State<DietAdvice> {
  String text_1 = 'Here are the tips you can follow to overcome your problem:';
  String text_2 = 'Hey!';
  List list1 = ['Eat more frequently.','Choose nutrient-rich foods.','Try smoothies and shakes.','Watch when you drink.','Make every bite count.','Have an occasional treat.','Exercise'];
  List list2 = ['Eat more fruit, vegetables, nuts, and whole grains.','Exercise, even moderately, for at least 30 minutes a day.','Cut down your consumption of fatty and sugary foods.','Use vegetable-based oils rather than animal-based fats.'];
  List list3 = ['Consume less “bad” fat and more “good” fat.','Consume less processed and sugary foods.','3.Eat more servings of vegetables and fruits.','4.Eat plenty of dietary fiber.','5. Focus on eating low–glycemic index foods.','6.Get the family involved in your journey.','Engage in regular aerobic activity.','Incorporate a weight training regimen.','9.Focus on reducing daily stress.'];
  Widget build(BuildContext context) {
    int diet_val = ModalRoute.of(context).settings.arguments;

    ListTile show_text_1() {
      if (diet_val == 2) {
        return ListTile(
          title: Text(
              'You are perfectly fine, Stay Healthy :)'
          ),
        );
      } else {
        return ListTile(
          title: Text(
              text_1
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
            height: 500,
            padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: ListView.builder(itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text((index+1).toString()),),
                    title: Text(list1[index]),
                  ),
                );
              },itemCount: list1.length,)
          );
        }
        else if (diet_val == 4) {
          return Container(
            height: 500,
              padding: EdgeInsets.all(10),
              child: ListView.builder(itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ListTile(

                    leading: CircleAvatar(child: Text((index+1).toString()),),
                    title: Text(list3[index]),
                  ),
                );
              },itemCount: list3.length,)

          );
        } else {
          return Container(
            height: 500,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child:ListView.builder(itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text((index+1).toString()),),
                    title: Text(list2[index]),
                  ),
                );
              },itemCount: list2.length,)

          );
        }
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
            show_text_1(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: show_text_2(),
            )
          ],
        ),
      ),
    );
  }
}