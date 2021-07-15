import 'dart:convert';

import 'package:dinamika/HomeScreen.dart';
import 'package:dinamika/LOGIN/Animation_login.dart';
import 'package:dinamika/SIGN_UP/selesai_verifikasi.dart';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';

import 'package:http/http.dart' as http;

import 'package:mailer2/mailer.dart';

import 'package:random_string/random_string.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   final String myUrl = "https://carinih.ws/api/user_account/";
  List data1;
  
  //
  Future<String>getData()async{
    var response = await http.get(Uri.parse(Uri.encodeFull(myUrl)),
    headers: {"Accept":"application/json"}
    );
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data1 = converDataToJson['data'];
    });
    return "Success";
  }
  //
  //
  String gmail;
  String pas;
  getRegister() async {
    var res = await http
        .get(Uri.parse(Uri.encodeFull('https://carinih.ws/api/web_profile/')));
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      gmail = jsonObj['data'][0]['gmail'];
      pas = jsonObj['data'][0]['password'];
      return print(jsonObj);
    } else {
      //
    }
//
//
  }

  String data;
  generate() {
    setState(() {
      data = randomAlphaNumeric(32).toLowerCase();
    });
    print(data);
  }

  //
  // String data;
  String statusinactive;
  String namauser;
  String emailuser;
  addData() {
    // var random = randomAlphaNumeric(32).toLowerCase();
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
      "verification_code": '$data',
      "reset_code": "",
      "role": "4",
      "status": 'inactive'
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonObj = json.decode(response.body);
        print(jsonObj);
        setState(() {
          data = '${jsonObj['data']['verification_code']}';
          statusinactive = '${jsonObj['data']['status']}';
          namauser = '${jsonObj['data']['user_name']}';
          emailuser = '${jsonObj['data']['email']}';
        });
      }
      print('$statusinactive');
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

//  main3() {
//   var document = parse(
//       """<body>$data <a href="www.html5rocks.com">HTML5 rocks!')""");
//   print(document.outerHtml);
// }

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
    //  parse(
    //     """<body>$data <a href="www.html5rocks.com">HTML5 rocks!')""");
    // print(document.outerHtml);
    // If you want to use an arbitrary SMTP server, go with `new SmtpOptions()`.
    // This class below is just for convenience. There are more similar classes available.
    var options = new GmailSmtpOptions()
      //  ..username = 'rakar5732@gmail.com'
      //   ..password =
      //       'xfgzrfnowxzdiwxg';
      ..username = 'appcarinih@gmail.com'
      ..password =
          'megfhehwrfqiufsu'; // Note: if you have Google's "app specific passwords" enabled,
    // you need to use one of those here.

    // How you use and store passwords is up to you. Beware of storing passwords in plain.

    // Create our email transport.
    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
      ..from = 'cari@carimakan.co.id'
      ..recipients.add('${email.text}')
      // ..bccRecipients.add('hidden@recipient.com')
      ..subject = 'CARInih & CARImakan'
      // ..attachments.add(new Attachment(file: new File('path/to/file')))
      // ..text = 'ini'
      // ..html =  "https://www.carinih.ws/webmin/verification/index/$data/";
      ..html =
          """<!DOCTYPE HTML PUBLIC '-//W3C//DTD XHTML 1.0 Transitional //EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
            <html xmlns='http://www.w3.org/1999/xhtml' xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office'>
            <head>
            <!--[if gte mso 9]>
            <xml>
              <o:OfficeDocumentSettings>
                <o:AllowPNG/>
                <o:PixelsPerInch>96</o:PixelsPerInch>
              </o:OfficeDocumentSettings>
            </xml>
            <![endif]-->
              <link href='https://carinih.ws/assets/fonts/font-awesome/css/font-awesome.min.css' rel='stylesheet'>
              <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
              <meta name='viewport' content='width=device-width, initial-scale=1.0'>
              <meta name='x-apple-disable-message-reformatting'>
              <!--[if !mso]><!--><meta http-equiv='X-UA-Compatible' content='IE=edge'><!--<![endif]-->

              <title></title>
              
                <style type='text/css'>
                  table, td { color: #000000; } a { color: #161a39; text-decoration: underline; }
            @media only screen and (min-width: 620px) {
              .u-row {
                width: 600px !important;
              }
              .u-row .u-col {
                vertical-align: top;
              }

              .u-row .u-col-50 {
                width: 300px !important;
              }

              .u-row .u-col-100 {
                width: 600px !important;
              }

            }

            @media (max-width: 620px) {
              .u-row-container {
                max-width: 100% !important;
                padding-left: 0px !important;
                padding-right: 0px !important;
              }
              .u-row .u-col {
                min-width: 320px !important;
                max-width: 100% !important;
                display: block !important;
              }
              .u-row {
                width: calc(100% - 40px) !important;
              }
              .u-col {
                width: 100% !important;
              }
              .u-col > div {
                margin: 0 auto;
              }
            }
            body {
              margin: 0;
              padding: 0;
            }

            table,
            tr,
            td {
              vertical-align: top;
              border-collapse: collapse;
            }

            p {
              margin: 0;
            }

            .ie-container table,
            .mso-container table {
              table-layout: fixed;
            }

            * {
              line-height: inherit;
            }

            a[x-apple-data-detectors='true'] {
              color: inherit !important;
              text-decoration: none !important;
            }

            </style>
              
              

            <!--[if !mso]><!--><link href='https://fonts.googleapis.com/css?family=Lato:400,700&display=swap' rel='stylesheet' type='text/css'><!--<![endif]-->

            </head>

            <body class='clean-body' style='margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-image: url(https://carinih.ws/assets/images/notif_email.png);background-size: cover;color: #000000'>
              <!--[if IE]><div class='ie-container'><![endif]-->
              <!--[if mso]><div class='mso-container'><![endif]-->
              <table style='border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;' cellpadding='0' cellspacing='0'>
              <tbody>
              <tr style='vertical-align: top'>
                <td style='word-break: break-word;border-collapse: collapse !important;vertical-align: top'>
                <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td align='center' style='background-color: #f9f9f9;'><![endif]-->
                

            <div class='u-row-container' style='padding: 0px;background-color: transparent;'>
              <div class='u-row' style='Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;'>
                <div style='border-collapse: collapse;display: table;width: 100%;background-color: transparent;'>
                  <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td style='padding: 0px;background-color: #f9f9f9;' align='center'><table cellpadding='0' cellspacing='0' border='0' style='width:600px;'><tr style='background-color: #f9f9f9;'><![endif]-->
                  
            <!--[if (mso)|(IE)]><td align='center' width='600' style='width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-100' style='max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;'>
              <div style='width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
            <table style='font-family:Lato,sans-serif;' role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:15px;font-family:Lato,sans-serif;' align='left'>
                    
              <table height='0px' align='center' border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid transparent;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%'>
                <tbody>
                  <tr style='vertical-align: top'>
                    <td style='word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%'>
                      <span>&#160;</span>
                    </td>
                  </tr>
                </tbody>
              </table>

                  </td>
                </tr>
              </tbody>
            </table>

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                </div>
              </div>
            </div>



            <div class='u-row-container' style='padding: 0px;background-color: transparent'>
              <div class='u-row' style='Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;'>
                <div style='border-collapse: collapse;display: table;width: 100%;background-color: transparent;'>
                  <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td style='padding: 0px;background-color: transparent;' align='center'><table cellpadding='0' cellspacing='0' border='0' style='width:600px;'><tr style='background-color: #161a39;'><![endif]-->
                  
            <!--[if (mso)|(IE)]><td align='center' width='600' style='background-color: #8f22a8;width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-100' style='max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;'>
              <div style='background-color: transparent;width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
           

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                </div>
              </div>
            </div>



            <div class='u-row-container' style='padding: 0px;background-color: transparent'>
              <div class='u-row' style='Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;'>
                <div style='border-collapse: collapse;display: table;width: 100%;background-color: transparent;'>
                  <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td style='padding: 0px;background-color: transparent;' align='center'><table cellpadding='0' cellspacing='0' border='0' style='width:600px;'><tr style='background-color: #ffffff;'><![endif]-->
                  
            <!--[if (mso)|(IE)]><td align='center' width='600' style='width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-100' style='max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;'>
              <div style='width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              <table width='100%' cellpadding='0' cellspacing='0' border='0' style='margin-top: 40px'>
              <tr>
                <td style='padding-right: 0px;padding-left: 0px;' align='center'>
                  
                  <img align='center' border='0' src='http://carinih.ws/assets/images/logo_c.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 30%;max-width: 83px;' width='80'/>
                  
                </td>
              </tr>
            </table>
            
            <table style='font-family:'Lato,sans-serif; role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:40px 40px 30px;font-family:Lato,sans-serif;' align='left'>
                    
              <div style='line-height: 140%; text-align: left; word-wrap: break-word;'>
                <p style='font-size: 14px; line-height: 140%;'>Hi</p>
            <p style='font-size: 14px; line-height: 140%;'><br /><span style='color: #843fa1; font-size: 14px; line-height: 19.6px;'><font color='#954ed9'><strong>${username.text}!</strong></font></span></p>
            <p style='font-size: 14px; line-height: 140%;'><br /><b>Terima kasih telah mendaftar di CARInih!</b> <br> Mohon aktifkan akun CARInih kamu dengan klik tombol verifikasi di bawah ini.</p>
            <p style='font-size: 14px; line-height: 140%;'><br />Apabila kamu tidak merasa mendaftar di CARInih, mohon abaikan<br />email ini atau hubungi kami di<span style='color: #843fa1; font-size: 14px; line-height: 19.6px;'><strong> <a style='color: #954ed9;' href='mailto:care@carinih.com'   rel='noopener'>care@carinih.com</a></strong></span></p>
              </div>

                  </td>
                </tr>
              </tbody>
            </table>

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                </div>
              </div>
            </div>



            <div class='u-row-container' style='padding: 0px;background-color: transparent'>
              <div class='u-row' style='Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;'>
                <div style='border-collapse: collapse;display: table;width: 100%;background-color: transparent;'>
                  <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td style='padding: 0px;background-color: transparent;' align='center'><table cellpadding='0' cellspacing='0' border='0' style='width:600px;'><tr style='background-color: #ffffff;'><![endif]-->
                  
            <!--[if (mso)|(IE)]><td align='center' width='600' style='width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-100' style='max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;'>
              <div style='width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
            <table style='font-family:Lato,sans-serif;' role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:0px 0px 0px 40px;font-family:Lato,sans-serif;' align='left'>
                    
            <div align='left'>
              <!--[if mso]><table width='100%' cellpadding='0' cellspacing='0' border='0' style='border-spacing: 0; border-collapse: collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;font-family:Lato,sans-serif;'><tr><td style='font-family:Lato,sans-serif;' align='left'><v:roundrect xmlns:v='urn:schemas-microsoft-com:vml' xmlns:w='urn:schemas-microsoft-com:office:word' href='https://www.carinih.com?verification_url' style='height:49px; v-text-anchor:middle; width:191px;' arcsize='63.5%' stroke='f' fillcolor='#6e1f6e'><w:anchorlock/><center style='color:#FFFFFF;font-family:Lato,sans-serif;'><![endif]-->
                <a href='https://www.carinih.ws/webmin/verification/index/$data' target='_blank' style='box-sizing: border-box;display: inline-block;font-family:Lato,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #954ed9; border-radius: 31px; -webkit-border-radius: 31px; -moz-border-radius: 31px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;border-top-width: 0px; border-top-style: solid; border-top-color: #CCC; border-left-width: 0px; border-left-style: solid; border-left-color: #CCC; border-right-width: 0px; border-right-style: solid; border-right-color: #CCC; border-bottom-width: 0px; border-bottom-style: solid; border-bottom-color: #CCC;'>
                  <span style='display:block;padding:15px 40px;line-height:120%;'><span style='font-size: 16px; line-height: 19.2px;'><strong><span style='line-height: 19.2px; font-size: 16px;'>Verifikasi Email</span></strong></span></span>
                </a>
              <!--[if mso]></center></v:roundrect></td></tr></table><![endif]-->
            </div>

                  </td>
                </tr>
              </tbody>
            </table>

            <table style='font-family:Lato,sans-serif;' role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:40px 40px 30px;font-family:Lato,sans-serif;' align='left'>
                    
              <div style='line-height: 140%; text-align: left; word-wrap: break-word;'>
                <p style='font-size: 14px; line-height: 140%;'>atau klik<br /><span style='color: #843fa1; font-size: 14px; line-height: 19.6px;'><strong><span style='font-size: 14px; line-height: 19.6px;'><a style='color: #954ed9;'<a href='https://www.carinih.ws/webmin/verification/index/$data' target='_blank' rel='noopener'>https://www.carinih.com/verification/$data</a></span></strong></span></p>
            <p style='font-size: 14px; line-height: 140%;'>&nbsp;</p>
            <p style='font-size: 14px; line-height: 140%;'><span style='color: #000000; font-size: 14px; line-height: 19.6px;'><span style='font-size: 14px; line-height: 19.6px;'>Dengan membuat akun, saya telah setuju dengan </span><strong><span style='font-size: 14px; line-height: 19.6px;'><span style='color: #954ed9; font-size: 14px; line-height: 19.6px;'>syarat &amp; ketentuan</span></span></strong><span style='font-size: 14px; line-height: 19.6px;'> serta <strong><span style='color: #954ed9; font-size: 14px; line-height: 19.6px;'>privacy policy </span></strong>dari CARInih</span></span></p>
              </div>

                  </td>
                </tr>
              </tbody>
            </table>

            <table style='font-family:Lato,sans-serif;' role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:5px 40px 30px;font-family:Lato,sans-serif;' align='left'>
                    
              <div style='line-height: 140%; text-align: left; word-wrap: break-word;'>
                <p style='font-size: 14px; line-height: 140%;color:black'>Tidak yakin kenapa kamu mendapatkan email ini? <a href='mailto:care@carinih.com' style='color:#954ed9'> Hubungi kita.</a><br />Salam CARI!</p>
              </div>

                  </td>
                </tr>
              </tbody>
            </table>

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                </div>
              </div>
            </div>



            <div class='u-row-container' style='padding: 0px;background-color: transparent;'>
              <div class='u-row' style='Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;'>
                <div style='border-collapse: collapse;display: table;width: 100%;background-color: white;'>
                  <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td style='padding: 0px;background-color: #ffffff;' align='center'><table cellpadding='0' cellspacing='0' border='0' style='width:600px;'><tr style='background-color: transparent;'><![endif]-->
                  
            <!--[if (mso)|(IE)]><td align='center' width='300' style='background-color: #ffffff;width: 300px;padding: 0px 24px 24px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-50' style='max-width: 320px;min-width: 300px;display: table-cell;vertical-align: top;'>
              <div style='background-color: #ffffff;width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px 24px 24px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
            <table style='font-family:Lato,sans-serif;' role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Lato,sans-serif;' align='left'>
                    
            <table width='100%' cellpadding='0' cellspacing='0' border='0'>
              <tr>

                <td style='padding-right: 0px;padding-left: 0px;' align='center'>
                  
                  <img align='center' border='0' src='http://carinih.ws/assets/images/logo_carinih.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 280px;' width='280'/>
                  
                </td>

              </tr>
            </table>



                  </td>
                </tr>
              </tbody>
            </table>

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
            <!--[if (mso)|(IE)]><td align='center' width='300' style='width: 300px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-50' style='max-width: 320px;min-width: 300px;display: table-cell;vertical-align: top;'>
              <div style='width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                </div>
              </div>
            </div>



            <div class='u-row-container' style='padding: 0px;background-color: transparent;'>
              <div class='u-row' style='Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;'>
                <div style='border-collapse: collapse;display: table;width: 100%;background-color: transparent;'>
                  <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td style='padding: 0px;background-color: #ffffff;' align='center'><table cellpadding='0' cellspacing='0' border='0' style='width:600px;'><tr style='background-color: transparent;'><![endif]-->
                  
            <!--[if (mso)|(IE)]><td align='center' width='600' style='background-color: #ffffff;width: 600px;padding: 0px 24px 24px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-100' style='max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;'>
              <div style='background-color: #ffffff;width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px 24px 24px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
            <table style='font-family:Lato,sans-serif;' role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Lato,sans-serif;' align='left'>
                    
              <div style='line-height: 140%; text-align: left; word-wrap: break-word;'>
                <p style='font-size: 14px; line-height: 140%;'><strong>PT Dasa Karya Indonesia (CARInih &amp; CARImakan)</strong></p>
              </div>

                  </td>
                </tr>
              </tbody>
            </table>

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                </div>
              </div>
            </div>



            <div class='u-col u-col-100' style='max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;background-color: #954ed9'>
              <div style='width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 17px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
            <table id='u_content_text_7' style='font-family:Lato ,sans-serif;' role=presentation cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td class='v-container-padding-padding' style='overflow-wrap:break-word;word-break:break-word;padding:7px;font-family:'Lato,sans-serif; align='left'>
                    
              <div class='v-line-height' style='line-height: 140%; text-align: left; word-wrap: break-word;'>
                <p style='font-size: 14px; line-height: 140%; text-align: center;'><span style='font-size: 14px; line-height: 19.6px;'><span style='color: white; line-height: 19.6px; font-size: 14px;'> <img align='center' border='0' src='http://carinih.ws/assets/images/sosial_media/ig.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 20px;' width='20'/>  @carinih | @carimakan_official </span><span style='color: white; line-height: 19.6px; font-size: 14px;'> <img align='center' border='0' src='http://carinih.ws/assets/images/sosial_media/fb.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 20px;' width='20'/>  <font color='white'>@carinih.id @CARImakan</font> </span></span></p>
            <p style='font-size: 14px; line-height: 140%; text-align: center;'><span style='font-size: 14px; line-height: 19.6px;'><span style='color: white; line-height: 19.6px; font-size: 14px;'> <img align='center' border='0' src='http://carinih.ws/assets/images/sosial_media/linkedin.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 20px;' width='20'/>  @CARInih | @CARImakan </span><span style='color: white; line-height: 19.6px; font-size: 14px;'> <img align='center' border='0' src='http://carinih.ws/assets/images/sosial_media/tiktok.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 20px;' width='20'/>  @carinih_id | @carimakan_officia </span></span></p>
            <p style='font-size: 14px; line-height: 140%; text-align: center;'><span style='color: white; font-size: 14px; line-height: 19.6px;'> <img align='center' border='0' src='http://carinih.ws/assets/images/sosial_media/wa.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 20px;' width='20'/>  0889 3838 889 </span><span style='color: white; font-size: 14px; line-height: 19.6px;'> <img align='center' border='0' src='http://carinih.ws/assets/images/sosial_media/mail.png' alt='Image' title='Image' style='outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 20px;' width='20'/> <a style='color: white;' href='mailto:care@carinih.com' target='_blank' rel='noopener'><font color='white'>care@carinih.com</font></a>&nbsp;<br /><font color='white'>www.carinih.com</font></span></p>
              </div>

                  </td>
                </tr>
              </tbody>
            </table>

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>



            <div class='u-row-container' style='padding: 0px;background-color: transparent'>
              <div class='u-row' style='Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;'>
                <div style='border-collapse: collapse;display: table;width: 100%;background-color: transparent;'>
                  <!--[if (mso)|(IE)]><table width='100%' cellpadding='0' cellspacing='0' border='0'><tr><td style='padding: 0px;background-color: transparent;' align='center'><table cellpadding='0' cellspacing='0' border='0' style='width:600px;'><tr style='background-color: #f9f9f9;'><![endif]-->
                  
            <!--[if (mso)|(IE)]><td align='center' width='600' style='width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;' valign='top'><![endif]-->
            <div class='u-col u-col-100' style='max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;'>
              <div style='width: 100% !important;'>
              <!--[if (!mso)&(!IE)]><!--><div style='padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;'><!--<![endif]-->
              
            <table style='font-family:Lato,sans-serif;' role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>
              <tbody>
                <tr>
                  <td style='overflow-wrap:break-word;word-break:break-word;padding:0px 40px 30px 20px;font-family:Lato,sans-serif;' align='left'>
                    
              <div style='line-height: 140%; text-align: left; word-wrap: break-word;'>
                
              </div>

                  </td>
                </tr>
              </tbody>
            </table>

              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
              </div>
            </div>
            <!--[if (mso)|(IE)]></td><![endif]-->
                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                </div>
              </div>
            </div>


                <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
                </td>
              </tr>
              </tbody>
              </table>
              <!--[if mso]></div><![endif]-->
              <!--[if IE]></div><![endif]-->

            </body>

            </html>""";

    // launch(
    //   "mailto:cari@carimakan.co.id?mailfrom:cari@carimakan.co.id?subject=Tcari@carimakan.co.id=https://www.carinih.com/verification/'${data}'");

    // Email it.
    emailTransport
        .send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
  }

  //
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Material(
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
                                  SizedBox(height: 10),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Kosong';
                                      }
                                      return null;
                                    },
                                    controller: username,
                                    decoration: InputDecoration(
                                     hintText: 'Nama Lengkap',
                                    hintStyle: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.grey[400],
                                          fontSize: 12),
                                      contentPadding:
                                          EdgeInsets.only(left: 20),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                      
                                      ),
                                  ),
                                  //
                                  SizedBox(height: 15),
                                  TextFormField(
                                     validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Kosong';
                                      }
                                      return null;
                                    },
                                    controller: email,
                                    decoration: InputDecoration(
                                       hintText: 'email',
                                      hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.grey[400],
                                            fontSize: 12),
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        )
                                        
                                        ),
                                  ),
                                  //
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //
                                  TextFormField(
                                     validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Kosong';
                                      }
                                      return null;
                                    },
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
                                         contentPadding:
                                            EdgeInsets.only(left: 20),
                                      border:OutlineInputBorder( 
                                        borderRadius: BorderRadius.circular(15)
                                      )
                                       
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
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Kosong';
                                      }
                                      return null;
                                    },
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
                                       contentPadding:
                                          EdgeInsets.only(left: 20),
                                    border:OutlineInputBorder( 
                                      borderRadius: BorderRadius.circular(15)
                                    )
                                     
                                   ),
                                  ),
                                  SizedBox(height: 10),
                                  //
                                  GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        generate();
                                        main1();
                                        addData();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SelesaiVerifikasi()));
                                      } else {
                                        // Scaffold.of(context).showSnackBar(
                                        //     SnackBar(
                                        //         content:
                                        //             Text('Processing Data')));
                                        getData();
                                      }

                                      //                          launch(
                                      // "mailto:cari@carimakan.co.id?mailfrom:cari@carimakan.co.id?subject=Tcari@carimakan.co.id=https://www.carinih.com/verification/'${data}'");
                                      // main3();

                                      // '$data'.contains('null')
                                      //     ? Fluttertoast.showToast(
                                      //         msg: "Sign Up Kembali",
                                      //         toastLength: Toast.LENGTH_SHORT,
                                      //         gravity: ToastGravity.CENTER,
                                      //         timeInSecForIosWeb: 1,
                                      //       )
                                      //     : main1();
                                      // getRegister();
                                      // addData();
                                      // '$data'.contains('null')
                                      //     ? SizedBox()
                                      //     : Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //             builder:
                                      //                 (BuildContext context) =>
                                      //                     SelesaiVerifikasi()));
                                      // //final Email email = Email(
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
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Text(
                                      'Dengan mendaftar saya menyetujui ',
                                      style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12),
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
      ),
    );
  }
}
