import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdukHome4 extends StatefulWidget {
  @override
  _ProdukHome4State createState() => _ProdukHome4State();
}

class _ProdukHome4State extends State<ProdukHome4> {
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
                    //ketiga
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(left: 20),
                        // color: Colors.pink,

                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:3.0,),
                                  child: Container(
                                    // height: 130,
                                    // width: 98,
                                     height: MediaQuery.of(context).size.height/5.9,
                                    // width: 98,
                                    child: Image(
                                        image: AssetImage(
                                      'gambar/produk/blackmore_multivitamin.png',
                                    ),fit: BoxFit.cover,),
                                  ),
                                ),
                                //
                                 Center(
                                   child: Padding(
                                     padding: const EdgeInsets.only(top:3),
                                     child: Container(
                                      height: MediaQuery.of(context).size.height/15,
                                      width: MediaQuery.of(context).size.width/1.6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color:Colors.grey),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Blackmores',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),),
                                          Text('Multivitamin',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),)
                                        ],
                                      )),
                                   ),
                                 ),
                                  //
                                SizedBox(height:8),
                                Text('Rp.350.000',style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa',fontSize: 22,fontWeight: FontWeight.bold),),
                                 SizedBox(height:8),
                                Text('Minuman Suplemen',style: TextStyle(color: Colors.black54,fontFamily: 'Comfortaa',fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                  SizedBox(height:8),
                                Container(
                                  width: MediaQuery.of(context).size.width/3,
                                  child: Image(image: AssetImage('gambar/images/rating_icon.png')))
                              ],
                            ),
                            //
                            //
                              Stack(
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
                            //
                              Padding(
                                  padding:
                                      const EdgeInsets.only(right:5, top: 30),
                                  child: Container(
                                  child:Container(
                                    width: MediaQuery.of(context).size.width/5,
                                    child: Text('Free Ongkir',style: TextStyle(fontSize:18,color:Colors.white,fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
                                  ),
                            ),
                            //
                                ],
                              ),
                          ],
                        )),
                        //
                        //ditengah
                     Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        // color: Colors.pink,

                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  // height: 125,
                                  // width: 270,
                                    height: MediaQuery.of(context).size.height/6,
                                  width: MediaQuery.of(context).size.width/1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 55.0, right: 55, top: 7),
                                    child: Image(
                                        image: AssetImage(
                                      'gambar/produk/masker_kesehatan.jpg',
                                    ),fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height:10),
                               Container(
                                  height: MediaQuery.of(context).size.height/15,
                                  width: MediaQuery.of(context).size.width/1.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color:Colors.grey),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('CARIstore',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text('Masker Kesehatan',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),)
                                    ],
                                  )),
                                  //
                                  SizedBox(height:8),
                                Text('Rp.25.000',style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa',fontSize: 22,fontWeight: FontWeight.bold),),
                                 SizedBox(height:8),
                                Text('Masker Kesehatan',style: TextStyle(color: Colors.black54,fontFamily: 'Comfortaa',fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                  SizedBox(height:8),
                                Container(
                                  width: MediaQuery.of(context).size.width/3,
                                  child: Image(image: AssetImage('gambar/images/rating_icon.png')))
                              ],
                            ),
                            //
                            //
                             Stack(
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
                            //
                            // 
                             Padding(
                                  padding:
                                      const EdgeInsets.only(left: 190, bottom: 180),
                                  child: Container(
                                   child: Padding(
                                  padding:
                                      const EdgeInsets.only(right:5, top: 30),
                                  child: Container(
                                  child:Container(
                                    width: MediaQuery.of(context).size.width/5,
                                    child: Text('Diskon 15%',style: TextStyle(fontSize:18,color:Colors.white,fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
                                  ),
                            ),
                                  ),
                            ),
                               ],
                             ),
                          ],
                        )),
                        //
                        //pertama
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey)),
                        // color: Colors.red,
                        margin: EdgeInsets.only(right: 20),
                        // color: Colors.pink,

                        child: Stack(
                          children: [
                            //
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 55.0, right: 55, top: 18),
                                    child: Image(
                                        image: AssetImage(
                                      'gambar/produk/masker_batik.png',
                                    )),
                                  ),
                                ),
                                //
                                Container(
                                  height: MediaQuery.of(context).size.height/15,
                                  width: MediaQuery.of(context).size.width/1.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color:Colors.grey),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('CARIstore',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text('Masker Batik 2 Lapis',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),)
                                    ],
                                  )),
                                  //
                                  SizedBox(height:8),
                                Text('Rp.25.000',style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa',fontSize: 22,fontWeight: FontWeight.bold),),
                                 SizedBox(height:8),
                                Text('Isi 3 (corak random)',style: TextStyle(color: Colors.black54,fontFamily: 'Comfortaa',fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                SizedBox(height:8),
                                Container(
                                  width: MediaQuery.of(context).size.width/3,
                                  child: Image(image: AssetImage('gambar/images/rating_icon.png')))
                              ],
                            ),
                            //
                              Stack(
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
                            //
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 190, bottom: 180),
                                  child: Container(
                                   child: Padding(
                                  padding:
                                      const EdgeInsets.only(right:5, top: 30),
                                  child: Container(
                                  child:Container(
                                    width: MediaQuery.of(context).size.width/5,
                                    child: Text('Free Ongkir',style: TextStyle(fontSize:18,color:Colors.white,fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
                                  ),
                            ),
                                  ),
                            ),
                                ],
                              ),
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
              padding: const EdgeInsets.only(left:5.0,right:5),
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
                        activeDotColor: Colors.indigo
                    ),
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
