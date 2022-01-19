import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:cr_user/login_page.dart';
import 'package:cr_user/network/api.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
      'name': nameController.text
    };

    var res = await Network().auth(data, 'register');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
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
            child: Image.asset('assets/logo.png'),
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
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            obscureText: true,
            controller: passController,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
