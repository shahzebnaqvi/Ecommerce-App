import 'dart:convert';
import 'package:eccomerceapp/models/product/view_product_service.dart';
import 'package:eccomerceapp/services/constant.dart';
import 'package:http/http.dart' as http;


Future getproducts() async {

  var url = Uri.parse("${baseurl}products?page=1");
  var response = await http.get(url);
  var responseData = jsonDecode(response.body);
  return ProductViewdata.fromJson(responseData);
}