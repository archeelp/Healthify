import 'package:flutter/material.dart';

import '../dummy.dart';

class DiseaseDetailScreen extends StatelessWidget {
  static const routeName = '/disease-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final diseaseId = ModalRoute.of(context).settings.arguments as String;
    final selecteddisease = DUMMY_DISEASES.firstWhere((disease) => disease.id == diseaseId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selecteddisease.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selecteddisease.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Symptoms'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(selecteddisease.symptoms[index])),
                    ),
                itemCount: selecteddisease.symptoms.length,
              ),
            ),
            buildSectionTitle(context, 'Cure'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                          title: Text(
                            selecteddisease.cure[index],
                          ),
                        ),
                        Divider()
                      ],
                    ),
                itemCount: selecteddisease.cure.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
