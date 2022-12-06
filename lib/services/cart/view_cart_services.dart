import 'dart:convert';
import 'package:eccomerceapp/services/constant.dart';
import 'package:http/http.dart' as http;


Future getcart() async {

  var url = Uri.parse("${baseurl}carts/{{user_id}}");
  var response = await http.get(url);
  var responseData = jsonDecode(response.body);
  // return CartViewdata.fromJson(responseData);
}