import 'package:flutter/material.dart';

class ForumDetail extends StatefulWidget {
  final String judul;
  const ForumDetail(this.judul, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForumDetailState();
}

class _ForumDetailState extends State<ForumDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(136, 124, 124, 1),
        title: Container(
          child: Text(widget.judul),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: InputDecoration(
                  suffixIcon: Image.asset('assets/send.png'),
                  hintText: 'Case Type',
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
