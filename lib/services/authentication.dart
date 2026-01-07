import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:found/screen/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class LoginObject {
  String email;
  String password;
  LoginObject(this.email, this.password);
  static Map<String, dynamic> usertoJson(LoginObject user) {
    return {"email": user.email, "password": user.password};
  }
}

Future<void> login(LoginObject user, BuildContext context) async {
  final uri = Uri.parse("http://localhost:8080/api/user/login");
  var response = await http.post(
    uri,
    headers: {'content-type': 'application/json'},
    body: jsonEncode(LoginObject.usertoJson(user)),
  );
  final data = jsonDecode(response.body);
  final header = response.headers;
  final box = Hive.box("secure_storage");
  await box.put("token", header["authorization"]);
  if (response.statusCode == 200) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(data["message"]), duration: Duration(seconds: 2)));
}

Future<void> logout() async {
  final box = Hive.box("secure_storage");
  await box.delete("token");
}
