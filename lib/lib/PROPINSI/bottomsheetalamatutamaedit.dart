import 'dart:convert';
import 'package:dinamika/DaftarAlamat/TambahAlamat.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bottomsheetalamatutamaedit extends StatefulWidget {
  const bottomsheetalamatutamaedit({Key key}) : super(key: key);

  @override
  _bottomsheetalamatutamaeditState createState() => _bottomsheetalamatutamaeditState();
}

class _bottomsheetalamatutamaeditState extends State<bottomsheetalamatutamaedit> {
  @override
  //
  TextEditingController tc;
  //
  bool _Yes = false;
  bool _No = false;
  bool _enabled = false;
   bool _disabled = false;
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
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                child:   SwitchListTile(
                               activeTrackColor: Colors.green,
                               activeColor: Colors.green,
                               
                               title:Text('Yes',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                    //   subtitle: Text(
                                    //   'Mendeteksi lokasi secara otomatis',
                                    //   style: TextStyle(
                                    //       color: Colors.black,
                                    //       fontFamily: 'Comfortaa',
                                    //       fontSize: 12),
                                    // ),
                                      value: _enabled,
                                      onChanged: (bool value){
                                        setState((){
                                          _enabled=value;
                                          });
                                      },
                                    ),
              ),
              SizedBox(
                height: 20,
              ),
              //
              GestureDetector(
                onTap: ()  {
                  print('ddddddddddddd');
                    //  final preff2 =
                    //                 await SharedPreferences.getInstance();
                    //             preff2.setString(
                    //                 'yes', 'No');
                    //                  Navigator.pushReplacement(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (BuildContext context) =>
                    //                         TambahAlamat()));
                  setState(() {
                    _No = !_No;
                  });
                },
                child:SwitchListTile(
  value: _disabled,
  onChanged: (bool value) async {
    final preff2 =
                                    await SharedPreferences.getInstance();
                                preff2.setString(
                                    'yes', '$value'.contains('false')?'no':'yes');
                                     Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            TambahAlamat()));
    print('$value'.contains('false')?'no':'yes');
    setState((){ 
      _disabled = value; 
      });
  },
  title: new Text('Toggle'),
)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
