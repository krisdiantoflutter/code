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