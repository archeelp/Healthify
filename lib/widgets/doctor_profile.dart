import 'package:app/models/doctor.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {

  final String exp,name ,q,imgurl;

  DoctorProfile(this.exp,this.name,this.q,this.imgurl);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      //onTap: () => selectCity(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        width: double.infinity,
        child: Card(
          color: Color.fromRGBO(102, 153, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgurl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8,),
                    Text(
                      q,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8,),
                    Text(
                      exp,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
