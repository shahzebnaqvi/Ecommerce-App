import 'dart:convert';
import 'package:eccomerceapp/services/constant.dart';
import 'package:http/http.dart' as http;

Future Loginfunc(email, pass) async {
  try {
    final response = await http.post(Uri.parse('${baseurl}auth/login'), body: {
      'email': '$email',
      'password': '$pass',
    });
    if (response.statusCode == 200) {
      return (json.decode(response.body));
    } else if (response.statusCode == 401) {
      return (json.decode(response.body));
    }
  } catch (e) {
    throw Exception('failed to login');
  }
}
