import 'package:flutter/material.dart';
import 'package:cr_user/login_page.dart';
import 'package:cr_user/main.dart';
import 'package:cr_user/pages/welcome.dart';

void main() {
  runApp(Barber());
}

class Barber extends StatelessWidget {
  Barber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/welcome': (context) => Welcome(),
        '/main': (context) => Main(),
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
