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


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter_ScreenUtil',
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
        home: HomePage(),
      ),
    );
  }
}
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
               height: 120.h,
              //  width: 30.sw,
               child: Image.asset(
                   'gambar/C_icon.png'),
               // child: CircularProgressIndicator(
               //   backgroundColor: Colors.white,
               // ),
               // height: 200.0,
               // width: 200.0,
             ),
             SizedBox(height: 5.h,),
           Loading(
                indicator: BallPulseIndicator(),
                size: 90.h,
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

