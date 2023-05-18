import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/constants.dart';
import 'package:lms_app/routes.dart';
import 'package:lms_app/screens/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// insitiale firebase

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS APP',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.sourceSansProTextTheme(
          Theme.of(context).textTheme,
        ).apply().copyWith(
          bodyText1: TextStyle(
            color: kTextWhiteColor,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
          subtitle2: TextStyle(
            color: kTextBlackColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}