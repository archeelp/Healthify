import 'package:flutter/material.dart';

import '../screens/disease_detail_screen.dart';
import '../models/disease.dart';

class DiseaseItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Type type;
  final List<String> symptoms;
  final List<String> cure;

  DiseaseItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.type,
    @required this.duration,
    @required this.symptoms,
    @required this.cure,
  });

  String get typeText {
    switch (type) {
      case Type.Chronic:
        return 'Chronic';
        break;
      case Type.Acute:
        return 'Acute';
        break;
      case Type.Moderate:
        return 'Moderate';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectDisease(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      DiseaseDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectDisease(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: FadeInImage(
                    placeholder: AssetImage('android/dev_assets/healthcare.png'),
                    image: NetworkImage(imageUrl),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // Icon(
                      //   Icons.schedule,
                      // ),
                      SizedBox(
                        width: 9,
                      ),
                      Text('$duration days'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 9,
                      ),
                      Text(typeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
