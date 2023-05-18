import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lms_app/screens/home_screen/home_screen.dart';

import '../../constants.dart';
import '../login_screen/login_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
        bottomNavigationBar: Container(
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              backgroundColor: kPrimaryColor,
              color: kTextBlackColor,
              activeColor: kTextBlackColor,
              tabBackgroundColor: kTextWhiteColor,
              padding: EdgeInsets.all(16),
              gap: 8,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.notification_add,
                  text: 'Notification',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),


        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              child: Column(
                children: [
                  sizedBox,
                  Image.asset(
                    'assets/images/NLearn.png',
                    height: 250.0,
                    width: 250.0,
                  ),

                ],
              ),

            ),
            sizedBox,
            Expanded(
              child: Container(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/ 2.5,
                    decoration: BoxDecoration(
                      color:kPrimaryColor,
                    ),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeCard(
                              onPress: (){
                                Navigator.pushNamedAndRemoveUntil(context,
                                    HomeScreen.routeName, (route) => false);
                              },
                              icon: 'assets/images/module.png',
                              title: 'Modules',


                            ),
                            HomeCard(
                              onPress: (){},
                              icon: 'assets/images/timetable.png',
                              title: 'Time Table',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeCard(
                              onPress: (){},
                              icon: 'assets/images/checklist.png',
                              title: 'Results',
                            ),
                            HomeCard(
                              onPress: (){
                                Navigator.pushNamedAndRemoveUntil(context,
                                    LoginScreen.routeName, (route) => false);
                              },
                              icon: 'assets/images/logout.png',
                              title: 'Logout',
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ],
        )
    );

  }

  setState(int Function() param0) {}
}




class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.onPress, required this.icon, required this.title}) : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding/1),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: kTextWhiteColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              icon,
              height: 50.0,
              width: 50.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: kDefaultPadding /3,
            )
          ],
        ),
      ),
    );
  }
}