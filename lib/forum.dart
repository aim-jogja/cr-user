import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 75,
              color: Color.fromARGB(136, 124, 124, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    children: <TextSpan>[
                      TextSpan(text: null),
                      TextSpan(
                          text: 'Forum Discussion',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 75,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Kasus - 1 ',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    children: <TextSpan>[
                      TextSpan(text: null),
                      TextSpan(
                          text: 'Kasus Pencurian di Tanah Abang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 75,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Kasus - 2 ',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    children: <TextSpan>[
                      TextSpan(text: null),
                      TextSpan(
                          text: 'Kasus Begal di Senayan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 75,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Kasus - 3 ',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    children: <TextSpan>[
                      TextSpan(text: null),
                      TextSpan(
                          text: 'Kasus Anak Hilang di Bekasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 75,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Kasus - 4 ',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    children: <TextSpan>[
                      TextSpan(text: null),
                      TextSpan(
                          text: 'Kasus Balapan Liar di monas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
