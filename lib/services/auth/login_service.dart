import 'dart:convert';
import 'package:eccomerceapp/services/constant.dart';
import 'package:http/http.dart' as http;

Future Loginfunc(email, pass) async {
  try {
 
    final response = await http.post(Uri.parse('${baseurl}auth/login'), body: {
      'email': '$email',
      'password': '$pass',
    });
  } catch (e) {

    throw Exception('failed to login');
  }
}