import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ProdukHome6 extends StatefulWidget{
  @override
  _ProdukHome6State createState() => _ProdukHome6State();
}

class _ProdukHome6State extends State<ProdukHome6> {
  @override
  Widget build(BuildContext context){
    return   SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 3.9,
                                 
                              child: Carousel(
                                // autoplay: true,
                                animationCurve: Curves.fastOutSlowIn,
                                animationDuration:
                                    Duration(milliseconds: 500),
                                dotSize: 6.0,
                                dotIncreasedColor: Colors.white,
                                dotBgColor: Colors.blue[300],
                                dotColor: Colors.white38,
                                dotPosition: DotPosition.bottomCenter,
                                borderRadius:true,
                                dotIncreaseSize: 2,
                                dotVerticalPadding: 0.0,
                                showIndicator: true,
                                indicatorBgPadding: 8.0,
                                images: [
                                 Padding(
                                   padding: const EdgeInsets.only(bottom:5.0),
                                   child: Container(
                                     decoration: BoxDecoration(
                                     color: Colors.deepPurple,
                                       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))
                                     ),
                                   ),
                                 ),
                               Padding(
                                   padding: const EdgeInsets.only(bottom:5.0),
                                   child: Container(
                                     decoration: BoxDecoration(
                                     color: Colors.red,
                                       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))
                                     ),
                                   ),
                                 ),
                              Padding(
                                   padding: const EdgeInsets.only(bottom:5.0),
                                   child: Container(
                                     decoration: BoxDecoration(
                                     color: Colors.orange,
                                       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))
                                     ),
                                   ),
                                 ),
                                ],
                              ),
                            );
  }
}