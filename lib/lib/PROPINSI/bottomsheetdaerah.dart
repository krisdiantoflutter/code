import 'dart:convert';
import 'package:dinamika/DaftarAlamat/TambahAlamat.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bottomsheetdaerah extends StatefulWidget {
  const bottomsheetdaerah({Key key}) : super(key: key);

  @override
  _bottomsheetdaerahState createState() => _bottomsheetdaerahState();
}

class _bottomsheetdaerahState extends State<bottomsheetdaerah> {
  @override
  //
  TextEditingController tc;
  //
  List data;

  //
  String idwilayah;
  Future<String> getDataPropinsi() async {
     final prefs = await SharedPreferences.getInstance();
    idwilayah = prefs.getString('idwilayah');
    var response = await http.get(
        Uri.parse(Uri.encodeFull(
            "https://carinih.ws/api/master_data_localization/district?district_region_id=$idwilayah")),
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
  @override
  void initState() {
    getDataPropinsi();
    super.initState();
    tc = TextEditingController();
  }

  //
  String query = '';
  //
  List results = [];

  //
  void setResults(String query) {
    results = data
        .where((elem) => elem['district_name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        // elem['contact_phone']
        //     .toString()
        //     .toLowerCase()
        //     .contains(query.toLowerCase()))
        .toList();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                //  width: 330.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.black26)),
                child: TextFormField(
                  controller: tc,
                  decoration: InputDecoration(
                    hintText: 'Cari Daerah',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    // suffixIcon: Icon(
                    //   Icons.arrow_drop_down_outlined,
                    // ),
                    contentPadding: EdgeInsets.only(top: 12, left: 14),
                  ),
                  onChanged: (v) {
                    setState(() {
                      query = v;
                      setResults(query);
                    });
                  },
                  style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa'),
                )),
            Expanded(
              child: query.isEmpty
                  ? ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      // scrollDirection: Axis.horizontal,
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: GestureDetector(
                              onTap: () async {
                                final preff2 =
                                    await SharedPreferences.getInstance();
                                preff2.setString(
                                    'daerah', data[i]['district_name']);
                                    //
                                      final preff3 =
                                    await SharedPreferences.getInstance();
                                preff3.setString(
                                    'idpost', data[i]['district_id']);
                                    //
                                      final preff4 =
                                    await SharedPreferences.getInstance();
                                preff4.setString(
                                    'kodepos', data[i]['post_code']);
                                //   final preff3 =
                                //     await SharedPreferences.getInstance();
                                // preff3.setString(
                                //     'iddaerah', data[i]['region_id']);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            TambahAlamat()));
                              },
                              child: Text(
                                data[i]['district_name'],
                                style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )),
                        );
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: results.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(results[i]['district_name']),
                          // subtitle: Text(results[ind]['contact_phone']),
                          onTap: () async {
                            final preff2 =
                                await SharedPreferences.getInstance();
                            preff2.setString(
                                'daerah', results[i]['district_name']);
                                //
                                  final preff3 =
                                await SharedPreferences.getInstance();
                            preff3.setString(
                                'idpost', results[i]['post_code']);
                                //
                                  final preff4 =
                                    await SharedPreferences.getInstance();
                                preff4.setString(
                                    'kodepos', data[i]['post_code']);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TambahAlamat()));
                          },
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
