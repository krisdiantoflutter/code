import 'dart:convert';

import 'package:http/http.dart' as http;


import 'model.dart';

//  "http:/www.emsifa.com/api-wilayah-indonesia/api/provinces.json";
class ServicesFinance {
  static Future<List<Modelfinance>> getUsers() async {
    try {
    
      //
      var response = await http.get(
          //sumatera
          Uri.parse(
              "https://carinih.ws/api/customer"),
          headers: {
            "Accept": "application/json",
            // 'token': '$value',
          });
      // final response = await http.get(url);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        List<Modelfinance> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Modelfinance> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Modelfinance>((json) => Modelfinance.fromJson(json))
        .toList();
  }
}
