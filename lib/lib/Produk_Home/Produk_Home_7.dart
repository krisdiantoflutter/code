import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdukHome7 extends StatefulWidget {
  @override
  _ProdukHome7State createState() => _ProdukHome7State();
}

class _ProdukHome7State extends State<ProdukHome7> {
  //
  final String myUrl = "https://carinih.ws/api/blog/";
  List data;

  //
  Future<String> getData() async {
    var response = await http.get(Uri.parse(Uri.encodeFull(myUrl)),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data = converDataToJson['data'];
    });
    return "Success";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  //
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
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1,
              child: PageView.builder(
                  controller: controller,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Card(
                      // color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                          ),
                          height: MediaQuery.of(context).size.height/4,
                          width: double.infinity,
                            child: Image(
                          image: NetworkImage(
                              'https://carinih.ws/uploads/upload_images/blog/${data[i]['image']}'),fit: BoxFit.cover,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data[i]['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Comfortaa',color: Colors.deepPurple[400]),textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(data[i]['desc'].split('.')[1],textAlign:TextAlign.center,style: TextStyle(),),
                        )
                      ],
                    ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height/20,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: data.length,
                      effect: JumpingDotEffect(

                          // spacing: 10.0,
                          radius: 10.0,
                          dotWidth: 8.0,
                          dotHeight: 16.0,
                          // offset: 10,
                          dotColor: Colors.blue[100],
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 1,
                          activeDotColor: Colors.indigo),
                    ),
                  ),
                ),
            ),
            
            //  Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   child: Text("Jumping Dot "),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5.0, right: 5),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height/20,
            //     width: double.infinity,
            //     color: Colors.grey[200],
            //     child: Center(
            //       child: SmoothPageIndicator(
            //         controller: controller,
            //         count: data.length,
            //         effect: JumpingDotEffect(

            //             // spacing: 10.0,
            //             // radius: 2.0,
            //             dotWidth: 24.0,
            //             dotHeight: 16.0,
            //             // offset: 10,
            //             dotColor: Colors.blue[100],
            //             paintStyle: PaintingStyle.fill,
            //             strokeWidth: 2,
            //             activeDotColor: Colors.indigo),
            //       ),
            //     ),
            //   ),
            // ),

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
            //     PageView(
            //   controller: controller,
            //   children: <Widget>[
            //     //
            //      Card(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(16),
            //             side: BorderSide(color: Colors.grey)),
            //         // color: Colors.red,
            //         margin: EdgeInsets.only(right: 20),
            //         // color: Colors.pink,

            //         child: Stack(
            //           children: [
            //             Align(
            //               alignment: Alignment.bottomCenter,
            //               child: Container(
            //                 height: MediaQuery.of(context).size.height / 7,
            //                 decoration: BoxDecoration(
            //                     color: Colors.yellow[800],
            //                     borderRadius: BorderRadius.only(
            //                         bottomLeft: Radius.circular(16),
            //                         bottomRight: Radius.circular(16))),
            //                 //  alignment: Alignment(10,19),
            //               ),
            //             ),
            //             //
            //             Align(
            //               alignment: Alignment.bottomCenter,
            //               child: Container(
            //                 width: double.infinity,
            //                 height:
            //                     MediaQuery.of(context).size.height / 8.5,
            //                 decoration: BoxDecoration(
            //                     color: Colors.deepPurple[400],
            //                     borderRadius: BorderRadius.only(
            //                         bottomLeft: Radius.circular(16),
            //                         bottomRight: Radius.circular(16))),
            //                 //  alignment: Alignment(10,19),
            //               child:Center(child: Text('Blackmores', style: TextStyle(
            //                               color: Colors.white,
            //                               fontFamily: 'Comfortaa',
            //                               fontSize: 25,
            //                               fontWeight: FontWeight.bold),
            //                         )),
            //               ),
            //             ),
            //             //
            //             Align(
            //               alignment: Alignment(0.0,-0.5),
            //               child:  Text(
            //                           'BLACKMORES',
            //                           style: TextStyle(
            //                               color: Colors.deepPurple[400],
            //                               fontFamily: 'Comfortaa',
            //                               fontSize: 30,
            //                               fontWeight: FontWeight.bold),
            //                         ),),
            //             //
            //           ],
            //         )),
            //     //
            //     Card(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(16),
            //             side: BorderSide(color: Colors.grey)),
            //         // color: Colors.red,
            //         margin: EdgeInsets.only(right: 20),
            //         // color: Colors.pink,

            //         child: Stack(
            //           children: [
            //             Align(
            //               alignment: Alignment.bottomCenter,
            //               child: Container(
            //                 height: MediaQuery.of(context).size.height / 7,
            //                 decoration: BoxDecoration(
            //                     color: Colors.yellow[800],
            //                     borderRadius: BorderRadius.only(
            //                         bottomLeft: Radius.circular(16),
            //                         bottomRight: Radius.circular(16))),
            //                 //  alignment: Alignment(10,19),
            //               ),
            //             ),
            //             //
            //             Align(
            //               alignment: Alignment.bottomCenter,
            //               child: Container(
            //                 width: double.infinity,
            //                 height:
            //                     MediaQuery.of(context).size.height / 8.5,
            //                 decoration: BoxDecoration(
            //                     color: Colors.deepPurple[400],
            //                     borderRadius: BorderRadius.only(
            //                         bottomLeft: Radius.circular(16),
            //                         bottomRight: Radius.circular(16))),
            //                 //  alignment: Alignment(10,19),
            //               child:Center(child: Text('Blackmores', style: TextStyle(
            //                               color: Colors.white,
            //                               fontFamily: 'Comfortaa',
            //                               fontSize: 25,
            //                               fontWeight: FontWeight.bold),
            //                         )),
            //               ),
            //             ),
            //             //
            //             Align(
            //               alignment: Alignment(0.0,-0.5),
            //               child:  Text(
            //                           'BLACKMORES',
            //                           style: TextStyle(
            //                               color: Colors.deepPurple[400],
            //                               fontFamily: 'Comfortaa',
            //                               fontSize: 30,
            //                               fontWeight: FontWeight.bold),
            //                         ),),
            //             //
            //           ],
            //         ),),
            //     //
            //     Card(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(16),
            //             side: BorderSide(color: Colors.grey)),
            //         // color: Colors.red,
            //         margin: EdgeInsets.only(right: 20),
            //         // color: Colors.pink,

            //         child: Stack(
            //           children: [
            //             Align(
            //               alignment: Alignment.bottomCenter,
            //               child: Container(
            //                 height: MediaQuery.of(context).size.height / 7,
            //                 decoration: BoxDecoration(
            //                     color: Colors.yellow[800],
            //                     borderRadius: BorderRadius.only(
            //                         bottomLeft: Radius.circular(16),
            //                         bottomRight: Radius.circular(16))),
            //                 //  alignment: Alignment(10,19),
            //               ),
            //             ),
            //             //
            //             Align(
            //               alignment: Alignment.bottomCenter,
            //               child: Container(
            //                 width: double.infinity,
            //                 height:
            //                     MediaQuery.of(context).size.height / 8.5,
            //                 decoration: BoxDecoration(
            //                     color: Colors.deepPurple[400],
            //                     borderRadius: BorderRadius.only(
            //                         bottomLeft: Radius.circular(16),
            //                         bottomRight: Radius.circular(16))),
            //                 //  alignment: Alignment(10,19),
            //               child:Center(child: Text('Blackmores', style: TextStyle(
            //                               color: Colors.white,
            //                               fontFamily: 'Comfortaa',
            //                               fontSize: 25,
            //                               fontWeight: FontWeight.bold),
            //                         )),
            //               ),
            //             ),
            //             //
            //             Align(
            //               alignment: Alignment(0.0,-0.5),
            //               child:  Text(
            //                           'BLACKMORES',
            //                           style: TextStyle(
            //                               color: Colors.deepPurple[400],
            //                               fontFamily: 'Comfortaa',
            //                               fontSize: 30,
            //                               fontWeight: FontWeight.bold),
            //                         ),),
            //             //
            //           ],
            //         )),
            //   ],
            // )),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   child: Text("Jumping Dot "),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5.0, right: 5),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height/20,
            //     width: double.infinity,
            //     color: Colors.grey[200],
            //     child: Center(
            //       child: SmoothPageIndicator(
            //         controller: controller,
            //         count: 3,
            //         effect: JumpingDotEffect(

            //             // spacing: 10.0,
            //             // radius: 2.0,
            //             dotWidth: 24.0,
            //             dotHeight: 16.0,
            //             // offset: 10,
            //             dotColor: Colors.blue[100],
            //             paintStyle: PaintingStyle.fill,
            //             strokeWidth: 2,
            //             activeDotColor: Colors.indigo),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
