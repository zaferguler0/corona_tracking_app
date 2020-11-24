import 'package:corona_tracking_app/screens/home_screen.dart';
import 'package:corona_tracking_app/screens/welcome_screen.dart';
import 'package:corona_tracking_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences mySharedPreferences = await SharedPreferences.getInstance();
  bool isLogin = mySharedPreferences.getBool("isLogin");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: isLogin == null ? WelcomeScreen() : HomeScreen(),
  ));
}
