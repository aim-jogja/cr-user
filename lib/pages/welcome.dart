import 'package:flutter/material.dart';
import 'package:cr_user/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cr_user/network/api.dart';
import 'package:cr_user/forum.dart';
import 'package:cr_user/report.dart';
import 'dart:convert';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Future<dynamic> _fetchDataUser() async {
    var res = await Network().getData('profil');
    var body = json.decode(res.body);
    return body;
  }

  var username;
  _getName() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    //
    if (localStorage.getString('token') != null) {
      await localStorage.clear();
    }
    var name = localStorage.getString('username');
    print(name);
    return name;
  }

  @override
  void _initState() {
    super.initState();
    username = _getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color.fromRGBO(227, 227, 220, 1),
                const Color.fromRGBO(0, 0, 0, 1),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Flexible(
            child: Container(
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50.0, 8.0, 0, 8.0),
                          child: Text(
                            "Welcome, User",
                            style: const TextStyle(fontSize: 29),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Image.asset('assets/bel.png'),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Image.asset('assets/user.png'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 50.0, 0, 0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/news.png',
                        width: 350,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 50.0, 0, 0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/map.png',
                        width: 350,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Image.asset(
                              'assets/forum.png',
                              width: 150,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => ForumPage()));
                            },
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            child: Image.asset(
                              'assets/report.png',
                              width: 150,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => ReportPage()));
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
