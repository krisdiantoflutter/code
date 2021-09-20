import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dinamika/MODEL/model_province.dart';

// class ServicesProvinsi {
//   static Future<List<ModelProvinsi>> getUsers() async {
//     try {
//       // final prefs = await SharedPreferences.getInstance();
//       // var value = prefs.getString('token');
//       //
//       var response = await http.get(
//           //sumatera
//           Uri.parse(Uri.encodeFull("https://carinih.ws/api/master_data_localization/province")),
//           // Uri.encodeFull("http://45.13.132.61:3000/wilayahindonesia/"),
//           headers: {
//             "Accept": "application/json",
//             // 'token': '$value',
//           });
//       // final response = await http.get(url);
//       if (response.statusCode == 200) {
//         print(json.decode(response.body));
//         List<ModelProvinsi> list = parseUsers(response.body); 
//         return list;
//       } else {
//         throw Exception("Error");
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   static List<ModelProvinsi> parseUsers(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed
//         .map<ModelProvinsi>((json) => ModelProvinsi.fromJson(json))
//         .toList();
//   }
// }

 Future<List<Job>> _fetchJobs() async {

    final jobsListAPIUrl = "https://carinih.ws/api/master_data_localization/province";
    final response = await http.get(Uri.parse(Uri.encodeFull(jobsListAPIUrl)));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }