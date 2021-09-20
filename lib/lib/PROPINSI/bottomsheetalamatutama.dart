import 'dart:convert';
import 'package:dinamika/DaftarAlamat/TambahAlamat.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bottomsheetalamatutama extends StatefulWidget {
  const bottomsheetalamatutama({Key key}) : super(key: key);

  @override
  _bottomsheetalamatutamaState createState() => _bottomsheetalamatutamaState();
}

class _bottomsheetalamatutamaState extends State<bottomsheetalamatutama> {
  @override
  //
  TextEditingController tc;
  //
  bool _Yes = false;
  bool _No = false;
  String _currText = '';

  List<String> text = [
    "YES",
    "NO",
  ];
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                   final preff2 =
                                    await SharedPreferences.getInstance();
                                preff2.setString(
                                    'yes', 'Yes');
                                     Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            TambahAlamat()));
                  setState(() {
                    _Yes = !_Yes;
                  });
                },
                child: Row(
                  children: [
                    Text('Yes'),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      color: _Yes?Colors.blue:Colors.green,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //
              GestureDetector(
                onTap: () async {
                     final preff2 =
                                    await SharedPreferences.getInstance();
                                preff2.setString(
                                    'yes', 'No');
                                     Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            TambahAlamat()));
                  setState(() {
                    _No = !_No;
                  });
                },
                child: Row(
                  children: [
                    Text('No '),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      color: _No?Colors.blue:Colors.green,
                    ),
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
