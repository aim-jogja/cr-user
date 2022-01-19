import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'http://192.168.1.13:8000/api/user/';
  var token;
  var photo;
  var name;
  var id;
  var email;
  var alamat;

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    id = localStorage.getInt('id');
    name = localStorage.getString('name')!;
    email = localStorage.getString('email')!;
  }

  auth(data, apiURL) async {
    var fullUrl = _url + apiURL;
    var res = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
    return res;
  }

  rToken() async {
    await getToken();
    return token;
  }

  getData(apiURL) async {
    var fullUrl = _url + apiURL;
    await getToken();
    var res = await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
    return res;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
