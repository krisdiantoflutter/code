import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdukHome3 extends StatefulWidget {
  @override
  _ProdukHome3State createState() => _ProdukHome3State();
}

class _ProdukHome3State extends State<ProdukHome3> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            SizedBox(
                // height: 210,
                // width: 440,
                height:MediaQuery.of(context).size.height/3.5,
              width:MediaQuery.of(context).size.width/1,
                child:
                    // PageView(
                    //   controller: controller,
                    //   children: List.generate(
                    //       6,
                    //       (_) => Card(
                    //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    //             child: Container(height: 280),
                    //           )),
                    // ),
                    PageView(
                  controller: controller,
                  children: <Widget>[
                    //
                     Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(right: 20),
                        // color: Colors.pink,

                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 7,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[800],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16))),
                                //  alignment: Alignment(10,19),
                              ),
                            ),
                            //
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height / 8.5,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16))),
                                //  alignment: Alignment(10,19),
                              child:Center(child: Text('Blackmores', style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Comfortaa',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )),
                              ),
                            ),
                            //
                            Align(
                              alignment: Alignment(0.0,-0.5),
                              child:  Text(
                                          'BLACKMORES',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),),
                            //
                          ],
                        )),
                    //
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(right: 20),
                        // color: Colors.pink,

                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 7,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[800],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16))),
                                //  alignment: Alignment(10,19),
                              ),
                            ),
                            //
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height / 8.5,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16))),
                                //  alignment: Alignment(10,19),
                              child:Center(child: Text('Blackmores', style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Comfortaa',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )),
                              ),
                            ),
                            //
                            Align(
                              alignment: Alignment(0.0,-0.5),
                              child:  Text(
                                          'BLACKMORES',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),),
                            //
                          ],
                        ),),
                    //
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(right: 20),
                        // color: Colors.pink,

                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 7,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[800],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16))),
                                //  alignment: Alignment(10,19),
                              ),
                            ),
                            //
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height / 8.5,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16))),
                                //  alignment: Alignment(10,19),
                              child:Center(child: Text('Blackmores', style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Comfortaa',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )),
                              ),
                            ),
                            //
                            Align(
                              alignment: Alignment(0.0,-0.5),
                              child:  Text(
                                          'BLACKMORES',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),),
                            //
                          ],
                        )),
                  ],
                )),
              SizedBox(height: MediaQuery.of(context).size.height/25),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   child: Text("Jumping Dot "),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                height: MediaQuery.of(context).size.height/20,
                width: double.infinity,
                color: Colors.grey[200],
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: JumpingDotEffect(

                        // spacing: 10.0,
                        // radius: 2.0,
                        dotWidth: 24.0,
                        dotHeight: 16.0,
                        // offset: 10,
                        dotColor: Colors.blue[100],
                        paintStyle: PaintingStyle.fill,
                        strokeWidth: 2,
                        activeDotColor: Colors.indigo),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
