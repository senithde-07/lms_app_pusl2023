import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget{
  static String routeName = 'SplashScreem';

  @override
  Widget build(BuildContext context){
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
    });

    return Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('School',style: Theme.of(context).textTheme.bodyText1!.copyWith(
              //       color: kTextWhiteColor,
              //       fontSize: 50.0,
              //       fontStyle: FontStyle.italic,
              //       letterSpacing: 2.0
              //     ),),
              //     Text('Brain',style: GoogleFonts.pattaya(
              //       fontSize: 50.0,
              //       fontStyle: FontStyle.italic,
              //       color: kTextWhiteColor,
              //       letterSpacing: 2.0,
              //       fontWeight: FontWeight.w700
              //     ),),
              //   ],
              // ),
              Image.asset('assets/images/NLearn.png', height: 300.0,
                width: 300.0,)
            ],
          ),
        )

    );
  }
}