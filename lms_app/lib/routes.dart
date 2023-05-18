import 'package:flutter/cupertino.dart';
import 'package:lms_app/screens/course_screen/course_screen.dart';
import 'package:lms_app/screens/home_screen/home.dart';
import 'package:lms_app/screens/home_screen/home_screen.dart';
import 'package:lms_app/screens/login_screen/login_screen.dart';
import 'package:lms_app/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder>routes = {
  SplashScreen.routeName : (context) => SplashScreen(),
  LoginScreen.routeName : (context) => LoginScreen(),
  HomeScreen.routeName : (context) => HomeScreen(),
  CourseScreen.routeName : (context) => CourseScreen(),
  Home.routeName : (context) => Home(),

};