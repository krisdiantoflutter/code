import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget{
  @override
  _TestApiState createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
//  var infos;
  final String myUrl = "https://carinih.ws/api/banner";
  List data;
  
  //
  Future<String>getData()async{
    var response = await http.get(Uri.parse(Uri.encodeFull(myUrl)),
    headers: {"Accept":"application/json"}
    );
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data = converDataToJson['data'];
    });
    return "Success";
  }
  
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
     
// ignore: deprecated_member_use
body:
// ListView(
//   children: [
//     // Text('${data[1]['image']}'),
//     Container(
//       height: 100,
//       width: double.infinity,
//       child: Image.network('https://carinih.ws/uploads/upload_images/banner_banner/${data[1]['image']}'),)
//   ],
// )
ListView.builder(itemCount:data == null ? 0:data.length,
  itemBuilder: (BuildContext context ,int i){
    return Container(
      child: Center(
        child: Column(
          children: [
            Card(
child:Text(data[i]['title']),
            ),
             Image.network('https://carinih.ws/uploads/upload_images/banner_banner/${data[i]['image']}'),
             Text(data[i]['banner_group']),
          ],
        ),
      ),
    );
  },
),

    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class ProdukHome2 extends StatefulWidget {
//   @override
//   _ProdukHome2State createState() => _ProdukHome2State();
// }

// class _ProdukHome2State extends State<ProdukHome2> {
//   final controller = PageController(viewportFraction: 0.8);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: MediaQuery.of(context).size.height/35,),
//             SizedBox(
//                height:MediaQuery.of(context).size.height/2.5,
//               width:MediaQuery.of(context).size.width/1,
//                 child:
//                     // PageView(
//                     //   controller: controller,
//                     //   children: List.generate(
//                     //       6,
//                     //       (_) => Card(
//                     //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                     //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                     //             child: Container(height: 280),
//                     //           )),
//                     // ),
//                     PageView(
//                   controller: controller,
//                   children: <Widget>[
//                     //
//                     Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(color: Colors.grey)),
//                         // color: Colors.red,
//                         margin: EdgeInsets.only(left: 20),
//                         // color: Colors.pink,

//                         child: Stack(
//                           children: [
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(top:3.0,),
//                                   child: Container(
//                                     // height: 130,
//                                     // width: 98,
//                                      height: MediaQuery.of(context).size.height/5.9,
//                                     // width: 98,
//                                     child: Image(
//                                         image: AssetImage(
//                                       'gambar/produk/blackmore_multivitamin.png',
//                                     ),fit: BoxFit.cover,),
//                                   ),
//                                 ),
//                                 //
//                                  Center(
//                                    child: Padding(
//                                      padding: const EdgeInsets.only(top:3),
//                                      child: Container(
//                                       height: MediaQuery.of(context).size.height/15,
//                                       width: MediaQuery.of(context).size.width/1.6,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         border: Border.all(color:Colors.grey),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text('Blackmores',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),),
//                                           Text('Multivitamin',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),)
//                                         ],
//                                       )),
//                                    ),
//                                  ),
//                                   //
//                                 SizedBox(height:8),
//                                 Text('Rp.350.000',style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa',fontSize: 22,fontWeight: FontWeight.bold),),
//                                  SizedBox(height:8),
//                                 Text('Minuman Suplemen',style: TextStyle(color: Colors.black54,fontFamily: 'Comfortaa',fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
//                                   SizedBox(height:8),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width/3,
//                                   child: Image(image: AssetImage('gambar/images/rating_icon.png')))
//                               ],
//                             ),
//                             //
//                               Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 190, bottom: 180),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow[800],
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(0),
//                                         bottomLeft: Radius.circular(100),
//                                         topRight: Radius.circular(20))),
//                                 //  alignment: Alignment(10,19),
//                               ),
//                             ),
//                           ],
//                         )),
//                         //
//                      Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(color: Colors.grey)),
//                         // color: Colors.red,
//                         margin: EdgeInsets.only(left: 10,right: 10),
//                         // color: Colors.pink,

//                         child: Stack(
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   // height: 125,
//                                   // width: 270,
//                                     height: MediaQuery.of(context).size.height/6,
//                                   width: MediaQuery.of(context).size.width/1,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 55.0, right: 55, top: 7),
//                                     child: Image(
//                                         image: AssetImage(
//                                       'gambar/produk/masker_kesehatan.jpg',
//                                     ),fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height:10),
//                                Container(
//                                   height: MediaQuery.of(context).size.height/15,
//                                   width: MediaQuery.of(context).size.width/1.6,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     border: Border.all(color:Colors.grey),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text('CARIstore',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),),
//                                       Text('Masker Kesehatan',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),)
//                                     ],
//                                   )),
//                                   //
//                                   SizedBox(height:8),
//                                 Text('Rp.25.000',style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa',fontSize: 22,fontWeight: FontWeight.bold),),
//                                  SizedBox(height:8),
//                                 Text('Masker Kesehatan',style: TextStyle(color: Colors.black54,fontFamily: 'Comfortaa',fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
//                                   SizedBox(height:8),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width/3,
//                                   child: Image(image: AssetImage('gambar/images/rating_icon.png')))
//                               ],
//                             ),
//                             //
//                              Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 190, bottom: 180),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow[800],
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(0),
//                                         bottomLeft: Radius.circular(100),
//                                         topRight: Radius.circular(20))),
//                                 //  alignment: Alignment(10,19),
//                               ),
//                             ),
//                           ],
//                         )),
//                         //
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(color: Colors.grey)),
//                         // color: Colors.red,
//                         margin: EdgeInsets.only(right: 20),
//                         // color: Colors.pink,

//                         child: Stack(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 190, bottom: 180),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow[800],
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(0),
//                                         bottomLeft: Radius.circular(100),
//                                         topRight: Radius.circular(20))),
//                                 //  alignment: Alignment(10,19),
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 55.0, right: 55, top: 18),
//                                     child: Image(
//                                         image: AssetImage(
//                                       'gambar/produk/masker_batik.png',
//                                     )),
//                                   ),
//                                 ),
//                                 //
//                                 Container(
//                                   height: MediaQuery.of(context).size.height/15,
//                                   width: MediaQuery.of(context).size.width/1.6,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     border: Border.all(color:Colors.grey),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text('CARIstore',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),),
//                                       Text('Masker Batik 2 Lapis',style: TextStyle(color: Colors.deepPurple[400],fontFamily: 'Comfortaa',fontSize: 18,fontWeight: FontWeight.bold),)
//                                     ],
//                                   )),
//                                   //
//                                   SizedBox(height:8),
//                                 Text('Rp.25.000',style: TextStyle(color: Colors.black,fontFamily: 'Comfortaa',fontSize: 22,fontWeight: FontWeight.bold),),
//                                  SizedBox(height:8),
//                                 Text('Isi 3 (corak random)',style: TextStyle(color: Colors.black54,fontFamily: 'Comfortaa',fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
//                                 SizedBox(height:8),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width/3,
//                                   child: Image(image: AssetImage('gambar/images/rating_icon.png')))
//                               ],
//                             ),
//                           ],
//                         )),
//                   ],
//                 )),
//             SizedBox(height: MediaQuery.of(context).size.height/25),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(vertical: 8),
//             //   child: Text("Jumping Dot "),
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(left:5.0,right:5),
//               child: Container(
//                height: MediaQuery.of(context).size.height/20,
//                 width: double.infinity,
//                 color: Colors.grey[200],
//                 child: Center(
//                   child: SmoothPageIndicator(
//                     controller: controller,
//                     count: 3,
//                     effect: JumpingDotEffect(
                      
//                       // spacing: 10.0,
//                         // radius: 2.0,
//                         dotWidth: 24.0,
//                         dotHeight: 16.0,
//                         // offset: 10,
//                         dotColor: Colors.blue[100],
//                         paintStyle: PaintingStyle.fill,
//                         strokeWidth: 2,
//                         activeDotColor: Colors.indigo
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
