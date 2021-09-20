import 'dart:convert';

import 'package:dinamika/DaftarAlamat/DaftarAlamat.dart';
import 'package:dinamika/General/general.dart';
import 'package:dinamika/KEAMANAN/ubahkatasandi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../HomeScreen.dart';

class Profile extends StatefulWidget {
  @override
    
     String idcustomer;
  Profile({Key key,this.idcustomer}) : super(key: key);
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  //
  final String myUrl = "https://carinih.ws/api/user_account/general";
  List data;
String daftar;
  //
  Future<String> getDataProfile() async {
    final prefs = await SharedPreferences.getInstance();
    daftar = prefs.getString('customerid');
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
//
 final String myUrl1 = "https://carinih.ws/api/user_account/information";
  List data1;

  //
  Future<String> getDataProfile1() async {
    var response = await http.get(Uri.parse(Uri.encodeFull(myUrl1)),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data1 = converDataToJson['data'];
    });
    return "Success";
  }
  //
  @override
  void initState() {
    getDataProfile();
      getDataProfile1();
    super.initState();
  }

  //
  String dataprofile;
  Future<void> setState(VoidCallback fn) async {
    final prefs = await SharedPreferences.getInstance();
    dataprofile = prefs.getString('dataprofile');
    super.setState(fn);
  }
  //
  Future<bool> _willPopCallback() async {
       Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen()),
                              (Route<dynamic> route) => false);
    return true; // return true if the route to be popped
}
  //
bool _enabled = false;
  Widget build(BuildContext context) {
    if(_enabled){
print('ffffff');
    }
    return Stack(
      children: [
        WillPopScope(
          onWillPop: _willPopCallback,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple[400],
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () =>   Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen()),
                              (Route<dynamic> route) => false)
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  // getJsonData();
                },
                child: Text(
                  "Pengaturan",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              centerTitle: false,
              titleSpacing: 0,
              leadingWidth: 35,
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 5,
                      color: Colors.grey,
                    ),
                    Stack(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              itemCount: data == null ? 0 : data.length,
                              itemBuilder: (BuildContext context, int i) {
                                return dataprofile == data[i]['email']
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 25.0,
                                               backgroundImage: NetworkImage('https://carinih.ws/uploads/upload_images/webmin_user/${data[i]['photo']}'),
                                              // backgroundColor: Colors.blue,
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10, top: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${data[i]['user_name']}',
                                                      style: TextStyle(
                                                          fontFamily: 'Comfortaa',
                                                          color:
                                                              Colors.deepPurple[400],
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'Rp.350.000 (5.000 Points)',
                                                      style: TextStyle(
                                                          fontFamily: 'Comfortaa',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox();
                              }),
                        ),
                        //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 80, left: 5, right: 5),
                                color: Colors.grey,
                                height: 1),
                            //
                            Stack(
                              children: [
                                Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.grey[200],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 40.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Mau mulai berbisnis ?',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Comfortaa',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Buka Toko Gratis',
                                                style: TextStyle(
                                                    color: Colors.deepPurple[400],
                                                    fontFamily: 'Comfortaa',
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        //
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 26, right: 26),
                                          child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border:
                                                    Border.all(color: Colors.grey),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 2,
                                                    offset: Offset(
                                                        0, 3), // Shadow position
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      margin:
                                                          EdgeInsets.only(left: 60),
                                                      child: Text(
                                                        'Pengaturen Toko Saya',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepPurple[400],
                                                            fontFamily: 'Comfortaa',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 13),
                                                      )),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.only(right: 10),
                                                      child: Icon(
                                                          Icons
                                                              .arrow_forward_ios_sharp,
                                                          size: 18,
                                                          color: Colors.black38))
                                                ],
                                              )),
                                        )
                                      ],
                                    )),
                                Positioned(
                                  top: 38,
                                  left: 20,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.yellow[800],
                                  ),
                                )
                              ],
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                color: Colors.grey,
                                height: 1),
                            //
                            SizedBox(
                              height: 15,
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Pengaturan Umum',
                                style: TextStyle(
                                    color: Colors.deepPurple[400],
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                            //
                            Stack(
                              children: [
                               
                                Container(
                                  margin: EdgeInsets.only(left:3,right: 5),
                                  child: ListTile(
                                    title: Text('General',
                                      style: TextStyle(
                                          color: Colors.deepPurple[400],
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 13),),
                                               subtitle:Text(
                                          'Data diri, Email, dan Nomor Telepon',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12),
                                        ),
                                        trailing:Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 25,
                                        color: Colors.deepPurple[400],
                                      ),
                                  ),
                                ),
                                 Container(
                                  //   height: 70,
                                  //  color: Colors.red,
                                   child: ListView.builder(
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemCount: data == null ? 0 : data.length,
                              itemBuilder: (BuildContext context, int i) {
                                   return dataprofile==data[i]['email']?Container(
                                      height: 70,
                                  //  color: Colors.red,
                                     child: GestureDetector(
                                       onTap: () async {
                                          final preff2 =
                                        await SharedPreferences.getInstance();
                                    preff2.setString(
                                        'datainformation', data[i]['id']);
                                         Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>General()));
                                       },
                                      ),
                                   ):SizedBox();
                              }
                                   ),
                                 ),//
                                  
                              ],
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                            
                               Stack(
                                 children: [
                                   Container(
                                    margin: EdgeInsets.only(left:3,right: 5),
                                    child: ListTile(
                                      title: Text('Keamanan',
                                        style: TextStyle(
                                            color: Colors.deepPurple[400],
                                            fontFamily: 'Comfortaa',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 13),),
                                                 subtitle:Text(
                                            'Ubah Kata Sandi',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Comfortaa',
                                                fontSize: 12),
                                          ),
                                          trailing:Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: 25,
                                          color: Colors.deepPurple[400],
                                        ),
                                    ),
                              ),
                              //
                              Container(
                                  //   height: 70,
                                  //  color: Colors.red,
                                   child: ListView.builder(
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemCount: data == null ? 0 : data.length,
                              itemBuilder: (BuildContext context, int i) {
                                   return dataprofile==data[i]['email']?Container(
                                      height: 70,
                                  //  color: Colors.red,
                                     child: GestureDetector(
                                       onTap: () async {
                                          final preff2 =
                                        await SharedPreferences.getInstance();
                                    preff2.setString(
                                        'datainformation', data[i]['id']);
                                         Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>UbahKataSandi()));
                                       },
                                      ),
                                   ):SizedBox();
                              }
                                   ),
                                 ),
                                 ],
                               ),
                            
                            //
                             //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                 //
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:3,right: 5),
                                  child: ListTile(
                                    title: Text('Daftar Alamat',
                                      style: TextStyle(
                                          color: Colors.deepPurple[400],
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 13),),
                                               subtitle:Text(
                                          'Alamat Penerimaan Pesanan',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12),
                                        ),
                                        trailing:Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 25,
                                        color: Colors.deepPurple[400],
                                      ),
                                  ),
                                ),
                                //
                                Container(
                                  //   height: 70,
                                  //  color: Colors.red,
                                   child: ListView.builder(
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemCount: data == null ? 0 : data.length,
                              itemBuilder: (BuildContext context, int i) {
                                   return dataprofile==data[i]['email']?Container(
                                      height: 70,
                                  //  color: Colors.red,
                                     child: GestureDetector(
                                       onTap: () async {
                                          final preff2 =
                                        await SharedPreferences.getInstance();
                                    preff2.setString(
                                        'datainformation', data[i]['id']);
                                         Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>DaftarAlamat()));
                                       },
                                      ),
                                   ):SizedBox();
                              }
                                   ),
                                 ),
                              ],
                            ),
                             //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Keuangan',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                           subtitle:Text(
                                      'Akun Bank',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                             //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                             SwitchListTile(
                               activeTrackColor: Colors.green,
                               activeColor: Colors.green,
                               title:Text('Lokasi',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                      subtitle: Text(
                                      'Mendeteksi lokasi secara otomatis',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                      value: _enabled,
                                      onChanged: (bool value){
                                        setState((){
                                          _enabled=value;
                                          });
                                      },
                                    ),
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                SizedBox(
                              height: 25,
                            ),
                            //
                                 Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Aktivitas Saya',
                                style: TextStyle(
                                    color: Colors.deepPurple[400],
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                            //
                            Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Daftar Transaksi',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                           subtitle:Text(
                                      'Daftar transaksi akun yang sudah dilakukan',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                            Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Wishlist',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                           subtitle:Text(
                                      'Daftar wishlist produk yang aku suka',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Ulasan',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                           subtitle:Text(
                                      'Daftar ulasan produk yang sudah aku lakukan',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                  Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Toko yang Di-follow',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                           subtitle:Text(
                                      'Daftar Toko yang sudah aku follow',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                  SizedBox(
                              height: 25,
                            ),
                            //
                                 Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Pusat Bantuan',
                                style: TextStyle(
                                    color: Colors.deepPurple[400],
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                            //
                            Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Pesanan Dikomplain',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                           subtitle:Text(
                                      'Daftar transaksi dikomplain aku yang sudah dilakukan',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                //
                            Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Bantuan CARIcare',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                           subtitle:Text(
                                      'Ingin mengetahui informasi CARI',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
                                    ),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                SizedBox(height:40),
                                //
                                Container(
                                // margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.black12,
                                height: 30),
                                //
                                 Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Tentang CARInih Apps',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('F&Q',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Syarat dan Ketentuan',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Kebijakan Privasi',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                                Container(
                              margin: EdgeInsets.only(left:3,right: 5),
                              child: ListTile(
                                title: Text('Pusat Bantuan',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),),
                                    trailing:Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Colors.deepPurple[400],
                                  ),
                              ),
                            ),
                            //
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 23),
                                color: Colors.grey,
                                height: 2),
                                //
                        //         Container(
                        //       margin: EdgeInsets.only(left:3,right: 5),
                        //       child: ListTile(
                        //         title: Text('Daftar Alamat',
                        //           style: TextStyle(
                        //               color: Colors.deepPurple[400],
                        //               fontFamily: 'Comfortaa',
                        //               fontWeight: FontWeight.w900,
                        //               fontSize: 13),),
                        //                    subtitle:Text(
                        //               'Alamat Penerimaan Pesanan',
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontFamily: 'Comfortaa',
                        //                   fontSize: 12),
                        //             ),
                        //             trailing:Icon(
                        //             Icons.arrow_forward_ios_sharp,
                        //             size: 25,
                        //             color: Colors.deepPurple[400],
                        //           ),
                        //       ),
                        //     ),
                        //      //
                        //     Container(
                        //         margin: EdgeInsets.only(left: 20, right: 23),
                        //         color: Colors.grey,
                        //         height: 2),
                        //         //
                        //         Container(
                        //   margin: EdgeInsets.only(left:3,right: 5),
                        //   child: ListTile(
                        //     title: Text('Daftar Alamat',
                        //       style: TextStyle(
                        //           color: Colors.deepPurple[400],
                        //           fontFamily: 'Comfortaa',
                        //           fontWeight: FontWeight.w900,
                        //           fontSize: 13),),
                        //                subtitle:Text(
                        //           'Alamat Penerimaan Pesanan',
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontFamily: 'Comfortaa',
                        //               fontSize: 12),
                        //         ),
                        //         trailing:Icon(
                        //         Icons.arrow_forward_ios_sharp,
                        //         size: 25,
                        //         color: Colors.deepPurple[400],
                        //       ),
                        //   ),
                        // ),
                        //  //
                        // Container(
                        //     margin: EdgeInsets.only(left: 20, right: 23),
                        //     color: Colors.grey,
                        //     height: 2),
                        //     //
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //
        Container(
          height: ScreenUtil().setHeight(30.h),
          color: Colors.white30,
        ),
      ],
    );
  }
}
