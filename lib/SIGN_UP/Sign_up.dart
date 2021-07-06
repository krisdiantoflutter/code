import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dinamika/HomeScreen.dart';
import 'package:dinamika/LOGIN/Animation_login.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

import 'package:mailer2/mailer.dart';

import 'package:random_string/random_string.dart';
import 'package:url_launcher/url_launcher.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //
  String dataku;
getRegister() async {
    var res = await http.get(Uri.parse(Uri.encodeFull('https://carinih.ws/api/web_profile/')));
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      dataku =jsonObj['data'][0]['email'];
     return print(dataku);
    }else{
      //
    }
//
//
  }
  //
  String data;
  addData() {
    var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    String myUrl = "https://carinih.ws/api/user_account/register";
    http.post(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      // "imei": "123456"
    }, body: {
      "user_name": username.text,
      "email": email.text,
      "mobile_phone": nomorhp.text,
      "password": pass.text,
      "verification_code": '$random',
      "register_code": "",
      "role":'4',
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonObj = json.decode(response.body);
        print(jsonObj);
        setState(() {
         data = '${jsonObj['data']['verification_code']}';
        });
      }
        return print('$data');
      //   return showDialog(
      //       context: context,
      //       barrierDismissible: false,
      //       builder: (BuildContext context) {
      //         return WillPopScope(
      //           onWillPop: () async => false,
      //           child: GestureDetector(onTap: () {
      //             Navigator.pop(context);
      //             // Navigator.pushAndRemoveUntil(
      //             //     context,
      //             //     MaterialPageRoute(
      //             //         builder: (BuildContext context) => HomeScreen()),
      //             //     (Route<dynamic> route) => false);
      //           }, child: StatefulBuilder(
      //             builder: (BuildContext context, StateSetter setState) {
      //               return SimpleDialog(
      //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //                 contentPadding: EdgeInsets.zero,
      //                 titlePadding: EdgeInsets.only(bottom: 0),
      //                 title: Column(
      //                   children: [
      //                     Container(
      //                       decoration: BoxDecoration(
      //                       color:Colors.deepPurple[400],
      //                         borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10))
      //                       ),
      //                       height:20,
      //                     ),
      //                     SizedBox(height:15),
      //                     Text('Akun Belum Aktiv'),
      //                     SizedBox(height:15),
      //                     RaisedButton(
      //                       child:Text('Verifikasi Akun'),
      //                       onPressed: (){
      //                         // _launchMap();
      //                       },
      //                     ),
      //                     SizedBox(height:15),
      //                   ],
      //                 )
      //               );
      //             },
      //           )),
      //         );
      //       });
      // } else {}
    });
//
//
  }
  // main() async {
  // String username = dataku;
  // String password =dataku;

  // final smtpServer = gmail(username, password);
  // // Use the SmtpServer class to configure an SMTP server:
  // // final smtpServer = SmtpServer('smtp.domain.com');
  // // See the named arguments of SmtpServer for further configuration
  // // options.  

  // // Create our message.
  // final message = Message()
  //   ..from = Address(username, 'Your name')
  //   ..recipients.add('evigendut77@gmail.com')
  //   // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //   // ..bccRecipients.add(Address('bccAddress@example.com'))
  //   ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
  //   // ..text = data
  //   ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  // try {
  //   final sendReport = await send(message, smtpServer);
  //   print('Message sent: ' + sendReport.toString());
  // } on MailerException catch (e) {
  //   print('Message not sent.');
  //   for (var p in e.problems) {
  //     print('Problem: ${p.code}: ${p.msg}');
  //   }
  // }
  // }

  //  void whatsapp({@required number, @required message}) async {
  //   String url = "whatsapp://send?phone=$number&text=$message";

  //   await canLaunch(url) ? print('salah') : launch(url);
  // }
  // }

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nomorhp = TextEditingController();
  TextEditingController pass = TextEditingController();
  //


  //   void _launchURL() async {
  //   final Uri params = Uri(
  //     scheme: 'mailto',
  //     path: 'evigendut77@gmail.com',
  //   );
  //   String  url = params.toString();
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     print( 'Could not launch $url');
  //   }
  // }
  main1() {
  // If you want to use an arbitrary SMTP server, go with `new SmtpOptions()`.
  // This class below is just for convenience. There are more similar classes available.
  var options = new GmailSmtpOptions()
    ..username = 'rakar5732@gmail.com'
    ..password = 'xfgzrfnowxzdiwxg'; // Note: if you have Google's "app specific passwords" enabled,
                                        // you need to use one of those here.
                                        
  // How you use and store passwords is up to you. Beware of storing passwords in plain.

  // Create our email transport.
  var emailTransport = new SmtpTransport(options);

  // Create our mail/envelope.
  var envelope = new Envelope()
    ..from = 'cari@carimakan.com'
    ..recipients.add('evigendut77@gmail.com')
    // ..bccRecipients.add('hidden@recipient.com')
    ..subject = 'Testing the Dart Mailer library'
    // ..attachments.add(new Attachment(file: new File('path/to/file')))
    ..text = 'This is a cool email message. Whats up?'
    ..html = 'https://www.carinih.com/verification/".$data."';

  // Email it.
  emailTransport.send(envelope)
    .then((envelope) => print('Email sent!'))
    .catchError((e) => print('Error occurred: $e'));

}
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
                        // getJsonData();
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
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.deepPurple[400],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comfortaa'),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Masukkan nomor handphone atau email anda.',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 10),
                                ),
                                //
                                SizedBox(height: 15),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: TextField(
                                    controller: username,
                                    decoration: InputDecoration(
                                        hintText: 'Nama Lengkap',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.grey[400],
                                            fontSize: 12),
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        border: InputBorder.none),
                                  ),
                                ),
                                //
                                SizedBox(height: 15),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: TextField(
                                    controller: email,
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.grey[400],
                                            fontSize: 12),
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        border: InputBorder.none),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: 15,
                                ),
                                //
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: TextField(
                                    controller: nomorhp,
                                    decoration: InputDecoration(
                                        hintText: 'Nomor Ponsel',
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
                                //
                                SizedBox(height: 10),
                                Text(
                                  'Contoh:  0812345678',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontFamily: 'Comfortaa',
                                      fontSize: 12),
                                ),
                                //
                                SizedBox(height: 15),
                                //
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: TextField(
                                    controller: pass,
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
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(height: 15),
                                //
                                GestureDetector(
                                  onTap: () {
        //                          launch(
        // "mailto:cari@carimakan.co.id?mailfrom:cari@carimakan.co.id?subject=Tcari@carimakan.co.id=https://www.carinih.com/verification/'${data}'");
  
                                    main1();
                                  // getRegister();
                                    addData();
//                                    final Email email = Email(
//   body: '',
//   subject: 'eeeeeeeeeeeee',
  
//   recipients: ['evigendut77@gmail.com'],
//   cc: ['evigendut77@gmail.com'],
//   // bcc: ['bcc@example.com'],
//   // attachmentPaths: ['/path/to/attachment.zip'],

// );

                //    whatsapp(
                // number: "+6281268152466",
                // message:'Hallo Admin, untuk mobil' );        
                // launch("https://mail.google.com/mail/mailto:<evigendut77@gmail.com>?subject='ddddddddddddd'&body=kfkfkfkffk'")     ;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      child: Center(
                                          child: Text('Selesai',
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.deepPurple[400]),
                                    ),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    'Dengan mendaftar saya menyetujui ',
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa', fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Syarat dan Ketentuan',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.blue[200],
                                            fontSize: 12),
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        'serta',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 12),
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        'Kebijakan Privasi',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.blue[200],
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //
                    ],
                  )),
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
