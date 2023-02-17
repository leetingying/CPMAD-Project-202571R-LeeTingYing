import 'package:flutter/material.dart';
import 'package:lee_ting_ying_project/screens/home_page.dart';
import 'package:lee_ting_ying_project/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Firestore App',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      home: LoginPage(),
    );
  }
}
