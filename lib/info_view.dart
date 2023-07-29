import 'dart:convert';


import 'package:fetch_info_using_api/input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var info_List = [];
  var listC = 0;
  var country = '';
  @override
  void initState() {
    // print('RESULTS PAGE OPEN!!!!!!!!!!!!!!!!');
    country = Input.country;
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    var url =
        Uri.parse('http://universities.hipolabs.com/search?country=$country');
    var response = await http.get(url);
    var decode = jsonDecode(response.body);
    info_List = decode;
    setState(() {
      listC = info_List.length;
    });
    // print(info_List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 8,
        title: Text('University Info'),
        // centerTitle: true,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 1,
            strokeAlign: 6,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listC,
            itemBuilder: (BuildContext contex, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(7, 4, 7, 4),
                child: Card(
                  color: Colors.grey.shade200,
                  elevation: 5,
                  margin: EdgeInsets.all(17),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info_List[index]["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          height: 2,
                        ),
                      ),
                      Text(
                          info_List[index]['state-province'] == null
                              ? 'State: ' + 'NA'
                              : 'State: ' +
                                  info_List[index]['state-province'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 2)),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Website: ',
                                style: TextStyle(
                                    color: Colors.deepPurple.shade900,
                                    height: 2,
                                    fontSize: 14,
                                ),
                            ),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: InkWell(
                                  onTap: () => launchUrl(Uri.https(
                                      info_List[index]['web_pages']
                                          .toString()
                                          .replaceAll('[', "")
                                          .replaceAll(']', "")
                                          .replaceAll('http://', "")
                                          .replaceAll('/', ""))),
                                  child: Text(
                                    info_List[index]['web_pages']
                                        .toString()
                                        .replaceAll('[', "")
                                        .replaceAll(']', ""),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      color: Colors.blue.shade800,
                                      fontSize: 14,
                                      // height: 2,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
