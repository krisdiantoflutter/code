import 'dart:convert';

import 'package:dinamika/LOGIN/Animation_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  //
  final String url = "https://carinih.ws/api/user_account/";

  getJsonData() async {
    http.Response response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "application/json"});
    print(response.body);

    var data = json.decode(response.body);
    // // setState(() {
    // //   data1 = data['data'][3]['image'];
    // //   data3 = data['data'][5]['image'];
    // //   data4 = data['data'][6]['image'];
    // //   data5 = data['data'][7]['banner_group'];
    // //   datagambar5 = data['data'][7]['image'];
    // //   data6 = data['data'][8]['banner_group'];
    // //   datagambar6 = data['data'][8]['image'];
    // // });

    print(data);
  }

  @override
  void initState() {
    getJsonData();
    super.initState();
  }

  //
  bool sandi = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            color: Colors.deepPurple[400],
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 18,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  title: GestureDetector(
                    onTap: () {
                      getJsonData();
                    },
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                          color: Colors.deepPurple[400],
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  centerTitle: false,
                  titleSpacing: 0,
                  leadingWidth: 35,
                ),
                body: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.deepPurple[400],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Masukkan nomor ponsel atau email yang terdaftar.',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa', fontSize: 10),
                              ),
                              SizedBox(height: 15),
                              //
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Nomor Ponsel / Email',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.grey[400],
                                          fontSize: 12),
                                      prefixIcon: Icon(
                                        Icons.perm_identity_rounded,
                                        size: 30,
                                        color: Colors.yellow[800],
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Contoh:  0812345678',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontFamily: 'Comfortaa',
                                    fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              //
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: TextFormField(
                                  obscureText: sandi,
                                  decoration: InputDecoration(
                                      hintText: 'Kata Sandi',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.grey[400],
                                          fontSize: 12),
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        size: 30,
                                        color: Colors.yellow[800],
                                      ),
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    sandi = !sandi;
                                                  });
                                                },
                                                child: sandi
                                                    ? Icon(
                                                        Icons
                                                            .visibility_off_outlined,
                                                        color: Colors
                                                            .deepPurple[400],
                                                      )
                                                    : Icon(Icons.remove_red_eye,
                                                        color: Colors
                                                            .yellow[800])),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Container(
                                                height: 20,
                                                width: 2,
                                                color: Colors.grey[400]),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Lupa?',
                                              style: TextStyle(
                                                  color: Colors.deepPurple[400],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Comfortaa'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 10),
                              //
                              GestureDetector(
                                onTap: () {
                                  getJsonData();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    child: Center(
                                        child: Text('Log In',
                                            style: TextStyle(
                                                color: Colors.white))),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.deepPurple[400]),
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                          thickness: 0.8,
                                          color: Colors.deepPurple[400]),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        'atau masuk dengan',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Comfortaa'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.8,
                                        color: Colors.deepPurple[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              //
                              Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(Icons.fingerprint,
                                              color: Colors.yellow[800])),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Sidik Jari',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa'),
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 15),
                              //
                              Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Akun Media Sosial',
                                      style: TextStyle(fontFamily: 'Comfortaa'),
                                    ),
                                  )),
                              SizedBox(height: 10),
                              //
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Belum punya akun CARInih? ',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.blue[200],
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ),
          ),
          //
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 20,
                  color: Colors.deepPurple[400],
                ),
              ),
              Stack(
                children: [
                  AnimationLogin(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Butuh bantuan ?',
                              style: TextStyle(
                                  fontSize: 12, fontFamily: 'Comfortaa'),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Hubungi kami',
                              style: TextStyle(
                                  color: Colors.blue[200],
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa'),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 30,
                bottom: 50,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('gambar/Login/simbol.png'))),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
// Container(
//         color: Colors.deepPurple[400],
//         child: SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               automaticallyImplyLeading: false,
//               leading: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.grey,
//                     size: 18,
//                   ),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ),
//               title: Text(
//                 "Kembali",
//                 style: TextStyle(
//                     color: Colors.deepPurple[400],
//                     fontFamily: 'Comfortaa',
//                     fontWeight: FontWeight.bold),
//               ),
//               centerTitle: false,
//               titleSpacing: 0,
//               leadingWidth: 35,
//             ),
