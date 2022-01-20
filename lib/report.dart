import 'dart:convert';
import 'dart:io';
import 'package:cr_user/forum.dart';
import 'package:flutter/material.dart';
import 'package:cr_user/network/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController casetypeController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  TextEditingController peristiwaController = TextEditingController();
  var imgFile;
  final imgPicker = ImagePicker();

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  kirim() async {
    var data = {
      'casetype': casetypeController.text,
      'lokasi': lokasiController.text,
      'peristiwa': peristiwaController.text
    };
    var res = await Network().auth(data, 'sendreport');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => ForumPage()));
    } else {
      _showMsg(body['message']);
    }
  }

  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
    });
    Navigator.of(context).pop();
  }

  Widget displayImage() {
    if (imgFile == null) {
      return Text('No Image Selected!');
    } else {
      return Image.file(imgFile, width: 75);
    }
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Options'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Capture Image From Camera'),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text('Take Image From Gallery'),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Image.asset('assets/report-icon.png'),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              controller: casetypeController,
              decoration: InputDecoration(
                hintText: 'Case Type',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              controller: lokasiController,
              decoration: InputDecoration(
                hintText: 'Lokasi Kejadian',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              controller: peristiwaController,
              decoration: InputDecoration(
                hintText: 'Peristiwa Kejadian',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DateTimeField(
              format: format,
              decoration: InputDecoration(
                hintText: 'Tanggal / Waktu Kejadian',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                TextFormField(
                  onTap: () {
                    showOptionsDialog(context);
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Upload Picture',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                displayImage(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Image.asset('assets/kirim.png'),
                  onTap: () {
                    kirim();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
