import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdukHome extends StatefulWidget {
  @override
  _ProdukHomeState createState() => _ProdukHomeState();
}

class _ProdukHomeState extends State<ProdukHome> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/35,),
            SizedBox(
              height:MediaQuery.of(context).size.height/2.5,
              width:MediaQuery.of(context).size.width/1,
                // height: 300,
                // width: 440,
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
                        margin: EdgeInsets.only(left: 20),
                        // color: Colors.pink,

                        child: Stack(
                          //ketiga
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 190, bottom: 180),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        bottomLeft: Radius.circular(100),
                                        topRight: Radius.circular(20))),
                                //  alignment: Alignment(10,19),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 55.0, right: 55, top: 7),
                                    child: Image(
                                        image: AssetImage(
                                      'gambar/produk/blackmore_c1000.png',
                                    )),
                                  ),
                                ),
                                //
                                Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    width:
                                        MediaQuery.of(context).size.width / 1.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Blackmores',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'BIO C 1000mg',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                //
                                // SizedBox(height: 6),
                                SizedBox(height: MediaQuery.of(context).size.height/150),
                                Text(
                                  'Rp.280.000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(height: 6),
                                 SizedBox(height: MediaQuery.of(context).size.height/150),
                                Container(
                                    // width: 160,
                                       width: MediaQuery.of(context).size.height/3.8,
                                    child: Text(
                                      'Pengiriman 1.5 km dari daerahmu',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ))
                              ],
                            ),
                          ],
                        )),
                    //
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        // color: Colors.pink,

                        child: Stack(
                          //tengah
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 190, bottom: 180),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        bottomLeft: Radius.circular(100),
                                        topRight: Radius.circular(20))),
                                //  alignment: Alignment(10,19),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 55.0, right: 55, top: 7),
                                    child: Image(
                                        image: AssetImage(
                                      'gambar/produk/blackmore_c1000.png',
                                    )),
                                  ),
                                ),
                                Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                   width: MediaQuery.of(context).size.width/1.6,                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Blackmores',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'BIO C 1000mg',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                //
                                // SizedBox(height: 6),
                                   SizedBox(height: MediaQuery.of(context).size.height/150),
                                Text(
                                  'Rp.280.000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(height: 6),
                                   SizedBox(height: MediaQuery.of(context).size.height/150),
                                Container(
                                      width: MediaQuery.of(context).size.height/3.8,
                                    child: Text(
                                      'Pengiriman 1.5 km dari daerahmue',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ))
                              ],
                            ),
                          ],
                        )),
                    //
                    Card(
                      //pertama
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(right: 20),
                        // color: Colors.pink,

                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 190, bottom: 180),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        bottomLeft: Radius.circular(100),
                                        topRight: Radius.circular(20))),
                                //  alignment: Alignment(10,19),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 55.0, right: 55, top: 7),
                                    child: Image(
                                        image: AssetImage(
                                      'gambar/produk/blackmore_c1000.png',
                                    )),
                                  ),
                                ),
                                //
                                Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    width: MediaQuery.of(context).size.width/1.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Blackmores',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'BIO C 1000mg',
                                          style: TextStyle(
                                              color: Colors.deepPurple[400],
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                //
                               SizedBox(height: MediaQuery.of(context).size.height/150),
                                Text(
                                  'Rp.280.000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                             SizedBox(height: MediaQuery.of(context).size.height/150),
                                Container(
                                     width: MediaQuery.of(context).size.height/3.8,
                                    child: Text(
                                      'Pengiriman 1.5 km dari daerahmu',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ))
                              ],
                            ),
                          ],
                        )),
                  ],
                )),
            // SizedBox(height: 40),
             SizedBox(height: MediaQuery.of(context).size.height/25),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   child: Text("Jumping Dot "),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                // height: 40,
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
