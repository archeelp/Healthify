import 'package:app/dummy.dart';
import 'package:app/screens/city_disease_screen.dart';
import 'package:app/screens/city_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/dummy_docs.dart';


class TabScreen extends StatefulWidget {

  static const routeName = '/tab';
  TabScreenState createState() => TabScreenState();
}

class TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> selectedPage;

  int selectedPageIndex = 0;

  void selectPage(index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {

    selectedPage = [
      {'page': CityDiseasesScreen(DUMMY_DISEASES), 'title': Text('Diseases')},
      {'page': CityDoctorScreen(dummyDocs), 'title': Text('Doctors')},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CityDoctorScreen.cityTitle = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      body: selectedPage[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(102, 153, 255 , 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Disease'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Doctors'),
          ),
        ],
        onTap: selectPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: selectedPageIndex,
      ),
    );
  }
}
