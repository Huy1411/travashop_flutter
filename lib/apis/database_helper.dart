import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trevashop_v2/Model/Category.dart';
import 'package:trevashop_v2/Screen/B4_ProfileScreen/B4_Profile/B4_Profile_Screen.dart';

class DatabaseHelper {
  String Base_Url = "http://192.168.1.15";
  String Port = "8080";

  Future<List<dynamic>> getAllCategory() async {
    var url = Uri.parse('${Base_Url}:${Port}/api/v1/category');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));

      List<dynamic> categories = data['categories'];
      return categories.toList();
    } else {
      throw Exception("Failed to load data from api");
    }
  }

  //login
  Future<http.Response> Login(String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin;
    var url = Uri.parse('${Base_Url}:${Port}/api/v1/customer/login');
    Map data = {
      "password": password,
      "username": username,
    };

    var body = json.encode(data);



    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      print("login success");
      print("account: ${response.body}");
      var jsonReponse = json.decode(response.body);
      isLogin = true;
      sharedPreferences.setString('logon', response.body);
      return response;
    } else {
      throw Exception("login failse");
    }
  }
}
