import 'dart:convert';

import 'package:cr_user/forum_detail.dart';
import 'package:flutter/material.dart';

import 'network/api.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  Future<List<dynamic>> _getReport() async {
    var result = await Network().getsData('crimereport');
    var body = json.decode(result.body);
    print(body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(136, 124, 124, 1),
        title: Container(
          child: Text("Forum Discussion "),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(227, 227, 220, 1),
                  const Color.fromRGBO(0, 0, 0, 1),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: FutureBuilder<List<dynamic>>(
          future: _getReport(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    shadowColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ForumDetail(
                                    snapshot.data[index]['description'])));
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(
                                  "Case Type : ${snapshot.data[index]['casetype']}"),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(
                                "Description : ${snapshot.data[index]['description']}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
