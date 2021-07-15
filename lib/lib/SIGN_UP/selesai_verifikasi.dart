import 'package:dinamika/LOGIN/Animation_login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../HomeScreen.dart';

class SelesaiVerifikasi extends StatefulWidget {
  @override
  _SelesaiVerifikasiState createState() => _SelesaiVerifikasiState();
}

class _SelesaiVerifikasiState extends State<SelesaiVerifikasi> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
                  Fluttertoast.showToast(
                    backgroundColor: Colors.deepPurple[400],
                    webPosition: "center",
              msg: 'Tekan Selesai untuk melanjutkan',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
          );
  
          return false;
      },
      child: Material(
        child: Stack(
          children: [
            Container(
              color: Colors.deepPurple[400],
              child: SafeArea(
                child: Scaffold(
                  body: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40.0, right: 40, top: 70),
                        child: Image.asset('gambar/Login/login_succsess.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pendaftaran Berhasil',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.deepPurple[400],
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Selamat Datang di Keluarga CARInih. Silahkan cek email kamu untuk mengaktifkan akun kamu.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Comfortaa', fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen()),
                              (Route<dynamic> route) => false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 10),
                          child: Container(
                            child: Center(
                                child: Text(
                              'selesai',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Comfortaa'),
                            )),
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepPurple[400]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                AnimationLogin(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    color: Colors.deepPurple[400],
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
