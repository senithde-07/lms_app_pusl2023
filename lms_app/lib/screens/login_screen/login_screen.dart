import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/custom_buttons.dart';
import '../../constants.dart';
import 'package:lms_app/screens/home_screen/home_screen.dart';

import '../home_screen/home.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/NLearn.png',
                    height: 150.0,
                    width: 150.0,
                  ),
                  sizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WELCOME!',
                          style: Theme.of(context).textTheme.bodyText1)
                    ],
                  ),
                  sizedBox,
                  Text('LOG IN TO YOUR ACCOUNT',
                      style: Theme.of(context).textTheme.subtitle2)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 3),
                  topRight: Radius.circular(kDefaultPadding * 3),
                ),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          sizedBox,
                          sizedBox,
                          buildEmailField(),
                          sizedBox,
                          buildPasswordField(),
                          sizedBox,
                          sizedBox,
                          DefaultButton(
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                final email = _emailController.text.trim();
                                final password =
                                _passwordController.text.trim();
                                final userCredential =
                                await signInWithEmailAndPassword(
                                    email, password);
                                if (userCredential != null) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      Home.routeName,
                                          (route) => false);
                                }
                              }
                            },
                            title: 'SIGN IN',
                            iconData: Icons.arrow_forward_outlined,
                          ),
                          sizedBox,
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontSize: 15.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
        controller: _emailController,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: kTextBlackColor,
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          labelText: 'Email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
        ),
        validator: (value) {
          RegExp regExp = new RegExp(emailPattern);
          if (value == null || value.isEmpty) {
            return 'Please Enter Your Email Address';
          } else if (!regExp.hasMatch(value)) {
            return 'Please Enter a valid Email Address';
          }
        });
  }

  TextFormField buildPasswordField() {
    return TextFormField(
        controller: _passwordController,
        obscureText: _passwordVisible,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
          color: kTextBlackColor,
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
            labelText: 'Password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: Icon(_passwordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_off_outlined),
              iconSize: kDefaultPadding,
            )),
        validator: (value) {
          if (value!.length < 5) {
            return ' Must Be More Than 5 Characters';
          }
        });
  }
}