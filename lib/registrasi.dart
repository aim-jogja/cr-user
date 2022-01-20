import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:cr_user/login_page.dart';
import 'package:cr_user/network/api.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final format = DateFormat("yyyy-MM-dd");
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'pria',
      'label': 'Pria',
      'icon': Icon(Icons.male_rounded),
    },
    {
      'value': 'wanita',
      'label': 'Wanita',
      'icon': Icon(Icons.female_rounded),
    },
  ];
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

  Future<void> _registrasi() async {
    var data = {
      'email': emailController.text,
      'password': passController.text,
      'username': nameController.text
    };

    var res = await Network().auth(data, 'register');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      //
      if (localStorage.getString('token') != null) {
        await localStorage.clear();
      }
      //localStorage.setString('token', body['token']);
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      print(body['message']);
      _showMsg(body['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    final field = Container(
      padding: EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 0),
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
          Hero(
            tag: "Logo",
            child: Image.asset(
              'assets/logo.png',
              width: 90.0,
            ),
          ),
          SizedBox(
            height: 21.0,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Name',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          DateTimeField(
            format: format,
            decoration: InputDecoration(
              hintText: 'DOB ( Date Of Birth )',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            obscureText: true,
            controller: passController,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown,
            items: _items,
            decoration: InputDecoration(
              hintText: 'Gender',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              _registrasi();
            },
            child: Text("Register".toString()),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                primary: const Color.fromRGBO(241, 209, 40, 1),
                fixedSize: Size(500, 30)),
          ),
        ],
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: field,
    );
  }
}
