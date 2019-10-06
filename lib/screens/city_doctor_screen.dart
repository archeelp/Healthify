import 'dart:convert';

import 'package:app/widgets/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/doctor.dart';

class CityDoctorScreen extends StatefulWidget {
  final List<Doctor> doctors;

  CityDoctorScreen(this.doctors);

  static Map<String, String> cityTitle;

  @override
  _CityDoctorScreenState createState() => _CityDoctorScreenState();
}

class _CityDoctorScreenState extends State<CityDoctorScreen> {
  List<Doctor> diplayedDoc;

  var cityId;
  
  var _isLoading = false;

  List<String> exp = [];

  List<String> name = [];

  List<String> q = [];

  var imgurl = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz3WNCwhrhQPga14FTBfxLHWNRTgdHq8ahRNt5JT-1XtuYPtNp",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyNRmjP2FnYIhyfAY3Uk_SpTVPaPWhSfRb_f3z598ER0dxIFuw",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpZALWesbqageji2LOzFXRMPJ1LHGGf9_LzIsy3FlXW4-ZgW4B",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmJarQHXhA2Ia_wFdP7BcAigP6XYOodfJW2HIrWMKcZs90Do9MXA",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW_0LaX5oFL0sTR_lD7dkGkYfiQbgjM3wf64VMbz3N7TjZDUPS",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpzEMKsQO9Dp0p6ucQaGs24-8GNGfELL9V1lLKeJ8pTmGV3KcB",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpxkNYJ6KtsKx6WjV9qvAk4coqMzyy16HEL2JRQGeAxROXEIBv_A",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcdIp72bafvZvjZ8Ox23FVTLiknOUQYQtjcKKM-K4AUpYArT6d",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa_RWfFQvBdKuh09_xc1FIiINdbaevnMgECXuPTliIOXKcdLc3lw",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4MhB5szikoYS2O4wrSxf7Uv1ozK3g7Jvv9hMpVd1DWAjfO1rV",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyysKeS9tA8M9aMGM16Z2JoLGJw1FEcFazeBkvbb5hVjUXHszK",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG7nfyANOL6bnpWAM7t8Wa_qexZAv0Qbh4ZtytvimzeOCBEJCWBg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFbW8Nchl9FZYzoViR6HfrX0CKxlOt25pcZXRMvQWHDnbF7vrl",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRonlKSi2v_FRMsiqTacpliFialJ-cKYDPaDsn2Fe4nihLCD6A60w",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhnl6GNOZMtYiBZjBN8MhZsem7lY--ixyfIsZvsP2spik2X-U6Q",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7kZsZvtlvywBfHxPMVBDfdJf2zGNyyxHkO9amRCKmwIwS3aOE",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP78lnDrzvFbNrpVbqXLuWOpJRnzo9XctsaZle-x3Id2oZepFj",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWyrW2RIsMIT4JlKy4eXtW90hyAyGJiH4VyiGCAQg6U657qVww",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-GEu5a2iB-8pp49rzNSBiKRcoZ6qooZdzClcD9qp5Ord5p98C",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm6-1mr0XA8bUejNnUyVhUw-RPewYLlN4HDxVrrYW2vSTBfrjR",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtuiba2oW1u7uRyacSJquWPxDaT4xQw5aruaPyPGZhZUNcm_mW",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0s3n8uEPjkyw-hw6bMZ8Yb050QHrDsw9btOnRkJH0AdkfkKUz4Q",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD-gOtIqJgY4rU2tIGqQfVv-lJWwiyzmrj5UfacWjP3aws-_oL",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKMtdAk4ca4mZG3ytNzGzac-z79gpBvV4SeqhWSK4UakaAuJh_",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1gXhqkUbEcF7x1SnBGUq0IPsez9wtkYp3mjP3V-ej-ORQNnTv",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPx2HomwOut_1Px4k25htU1e3UEeQ5nscHv-zvz30y0l1TKniVQ",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzg1nRE29B1Jt2uVJtbUGzpLY_VrbLyfr32bYpoT7lSRPAHSAF",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIV4mGu-Jez6WYpcLTNO5rUZkMj2ldkUeRSg9aBuhvXh4LXIfP",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzg1nRE29B1Jt2uVJtbUGzpLY_VrbLyfr32bYpoT7lSRPAHSAF",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlgcKHR4TO1SHV3uH8dgDwiaXfRB_A4p1qcxarGrmvkicMTkN0cw",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuK_qYifPCWLAHbVPfpzh25S2aI4aXiR-pnXHPtHljlwl87we7",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6MZ_sJd--OASUOMNakui3jAsh06YS5tiyI7fnYZUpzMxHBGe2_g",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfYB35iFfj_iMt0bb0BGm-gVOYoGMsXadvFQZo6o15zxw-MOmZ",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRYNw9IxrqOD0YCXDYOzzQFvv-8h5btBaBYPmt9uy6hMBTUJHl",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR-eh1nC_ddzeEz9AWwm6cqfaED0BtUUD4PKbZMeKJVUYaVgI-",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0VE12kQ1GPhonPrv6lesEMxLeKf5EbH-fW94IzWs2RkWXW75g",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbxCVATFctzcCxwY4KvKb2L2SUYIct1otzVCORL7RNuFWt_7Lf",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK8laymHV1vVTD0fK1sLa_-FPQ-sS7EWAAqzpa4mv_AYBaEtDozA",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbMP5N9brH2djTqaSVJ5XgMKKexBaJAVvUwjw3p8mZjzcU2MiO",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVV2C9Wd4dmYbsUCn_H5I4BMn9UYZsKmwvQcKVcaKMCMuXJB58"
  ];

  @override
  void initState() {
    fetchAndSetProducts();
  }

  Future<void> fetchAndSetProducts() async {
    setState(() {
        _isLoading = true;
      });
    final url =
        'http://da5eeaae.ngrok.io//${CityDoctorScreen.cityTitle['title']}';
    try {
      final response = await http.get(url);
      print(response.body);
      setState(() {
        final Map<String, dynamic> extractedData =
            jsonDecode(response.body) as Map<String, dynamic>;
        for (int i = 0; i < extractedData.length; i++) {
          exp.add(extractedData[i.toString()]['exp']);
          name.add(extractedData[i.toString()]['name']);
          q.add(extractedData[i.toString()]['q']);
        }
      });
    } catch (error) {
      throw (error);
    }
     setState(() {
        _isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          :  ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: exp.length,
        itemBuilder: (ctx, index) {
          print(exp[index]);
          return DoctorProfile(exp[index], name[index], q[index],imgurl[index]);
        },
      ),
    );
  }
}
