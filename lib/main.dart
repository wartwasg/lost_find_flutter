import 'package:flutter/material.dart';
import 'package:found/screen/home_page.dart';
import 'package:found/screen/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

late dynamic token;
void main() async {
  await Hive.initFlutter();
  await Hive.openBox("secure_storage");
  final box = Hive.box("secure_storage");
  token = await box.get("token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: token != null ? HomePage() : LoginPage(),
    );
  }
}
