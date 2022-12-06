import 'dart:convert';
import 'package:eccomerceapp/services/constant.dart';
import 'package:http/http.dart' as http;

Future Loginfunc(id, variant,user_id,quantity) async {
  try {
 
    final response = await http.post(Uri.parse('${baseurl}carts/add'), body: {
      'id': '$id',
      'variant': '$variant',
      'user_id': '$user_id',
      'quantity': '$quantity',
    });
  } catch (e) {

    throw Exception('failed to login');
  }
}