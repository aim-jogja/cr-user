import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  TextEditingController peristiwaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 90.0, 15.0, 0),
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
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              controller: lokasiController,
              decoration: InputDecoration(
                hintText: 'Lokasi Kejadian',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              obscureText: true,
              controller: peristiwaController,
              decoration: InputDecoration(
                hintText: 'Peristiwa Kejadian',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Kirim".toString()),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: const Color.fromRGBO(241, 209, 40, 1),
                  fixedSize: Size(500, 30)),
            ),
          ],
        ),
      ),
    );
  }
}
