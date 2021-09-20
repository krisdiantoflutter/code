import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;

class Propinsi extends StatefulWidget{
  @override
  _PropinsiState createState() => _PropinsiState();
}

class _PropinsiState extends State<Propinsi> {
  @override
  //
 List data;

  //
  String daftaralamat;
   getDataProvisi() async {
    // final prefs = await SharedPreferences.getInstance();
    // daftaralamat = prefs.getString('customerid');
    var response = await http.get(Uri.parse(Uri.encodeFull('https://carinih.ws/api/master_data_localization/province')),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data = converDataToJson['data'];
    });
    return "Success";
  }
  void initState(){
    getDataProvisi();
    super.initState();
  }
  //
  TextEditingController search = TextEditingController();
  //
  Widget build(BuildContext context){
    return Stack(
      children: [
        Scaffold(
           appBar: AppBar(
                backgroundColor: Colors.deepPurple[400],
                automaticallyImplyLeading: false,
                // leading: Padding(
                //   padding: const EdgeInsets.only(left: 5.0),
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.arrow_back_ios,
                //       color: Colors.white,
                //       size: 18,
                //     ),
                //     onPressed: () => Navigator.of(context).pop(),
                //   ),
                // ),
                title: GestureDetector(
                  onTap: () {
                    // getJsonData();
                  },
                  child: Text(
                    "Propinsi",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w900,
                        fontSize: 18.sp),
                  ),
                ),
                centerTitle:true,
                // titleSpacing: 0,
                // leadingWidth: 35,
              ),
              body:Column(
                children: [
                  SizedBox(height: 10.h,),
                    Container(
                        margin: EdgeInsets.only(right: 15.w),
                        //  width: 330.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black26)),
                        child: TextFormField(
                          // enabled: false,
                          controller: search,
                          decoration: InputDecoration(
                            hintText: 'Cari Propinsi',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            // suffixIcon: Icon(
                            //   Icons.arrow_drop_down_outlined,
                            // ),
                            contentPadding: EdgeInsets.only(top: 13.h, left: 14.w),
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                          style:
                              TextStyle(fontSize: 15.sp, fontFamily: 'Comfortaa'),
                        )),
                        //
                        Expanded(
                                   child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              itemCount: data == null ? 0 : data.length,
                              itemBuilder: (BuildContext context, int i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data[i]['province_name'],style: TextStyle(fontFamily: 'Comfortaa',fontWeight:FontWeight.w900,fontSize: 15.sp,color: Colors.deepPurple[400],)),
                                );
                              }
                                             ),
                        )
                ],
              )
        ),
          Container(
          height: ScreenUtil().setHeight(30.h),
          color: Colors.deepPurple[200],
        ),
      ],
    );
  }
}