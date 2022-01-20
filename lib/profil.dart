import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(136, 124, 124, 1),
        title: Container(
          child: Text("Profile"),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0),
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
            Image.asset(
              'assets/user.png',
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("U10001".toString()),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: const Color.fromRGBO(255, 240, 240, 1),
                  fixedSize: Size(80, 30)),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'Nama : Naufal',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  'Tanggal Lahir : 10-03-1999',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  'Jenis Kelamin : Pria',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  'Email : naufal@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  'Nomor Telepon : 08999999999',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit Profil".toString()),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      primary: const Color.fromRGBO(241, 209, 40, 1),
                      fixedSize: Size(120, 30)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
