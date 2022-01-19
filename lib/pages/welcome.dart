import 'package:flutter/material.dart';
import 'package:cr_user/main.dart';
import 'package:cr_user/network/api.dart';
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

  @override
  void _initState() {
    super.initState();
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Welcome, Police",
                            style: const TextStyle(fontSize: 29),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: Image.asset('assets/bel.png'),
                          onTap: () {},
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
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/news.png',
                        width: 320,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/map.png',
                        width: 320,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/forum.png',
                            width: 85,
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Image.asset(
                            'assets/report.png',
                            width: 85,
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
