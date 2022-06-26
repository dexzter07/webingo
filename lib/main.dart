import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:webingo/views/auth/sign_in.dart';
import 'package:webingo/views/auth/sign_up.dart';
import 'package:webingo/views/main_page.dart';
import 'package:webingo/views/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}


