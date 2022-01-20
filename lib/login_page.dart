import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:cr_user/login_page.dart';
import 'package:cr_user/network/api.dart';
import 'package:cr_user/pages/welcome.dart';
import 'package:cr_user/registrasi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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

  Future<void> _login() async {
    var data = {'email': emailController.text, 'password': passController.text};

    var res = await Network().auth(data, 'login');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      //
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Welcome()));
    } else {
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
          SizedBox(
            height: 65.0,
          ),
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
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
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
              _login();
            },
            child: Text("Masuk".toString()),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                primary: const Color.fromRGBO(241, 209, 40, 1),
                fixedSize: Size(500, 30)),
          ),
          TextButton(
            child: const Text(
              'Belum Punya akun?',
              style: TextStyle(color: Colors.black54),
            ),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Registrasi()));
            },
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
