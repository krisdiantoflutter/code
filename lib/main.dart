import 'dart:async';

import 'package:dinamika/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //
  void completed() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  //  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback(callback);
  // }
 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), completed);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
        ),
       child: Center(
         child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               height: 150,
               child: Image.asset(
                   'gambar/C_icon.png'),
               // child: CircularProgressIndicator(
               //   backgroundColor: Colors.white,
               // ),
               // height: 200.0,
               // width: 200.0,
             ),
             SizedBox(height: 20,),
           Loading(
                indicator: BallPulseIndicator(),
                size: 80.0,
               color: Colors.grey[400],
              ),
           ],
         ),
       ),
        // child: new SplashScreen(
        //    seconds: 5,
        // // navigateAfterSeconds: HomeScreen(),
        //   // title: new Text(
        //   //   'Welcome To CARInih',
        //   //   style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        //   // ),
          
        //   // image: Image(
        //   //   image:AssetImage(
        //   //     'gambar/C_icon.png'),
        //   //       height: 150,
        //   // ),
        //   backgroundColor: Colors.white,
        //       styleTextUnderTheLoader: new TextStyle(),
        //       photoSize: 100.0,
        //       onClick: () => print("Flutter Egypt"),
        //       useLoader: true,
        //       loaderColor:Color(0xFF954DE9),
        // ),
      ),
    );
  }
}

