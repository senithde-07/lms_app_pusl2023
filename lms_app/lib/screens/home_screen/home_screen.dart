import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lms_app/screens/course_screen/course_screen.dart';
import '../../constants.dart';
import '../home_screen/home.dart';
import '../login_screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

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
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, Home.routeName);
          },
        ),
        backgroundColor: kTextBlackColor,

        title: const Text('COURSE OVERVIEW'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          sizedBox,
          Expanded(
            child: Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              CourseScreen.routeName,
                                  (route) => false,
                            );
                          },
                          icon: 'assets/images/Lecture.png',
                          title: 'PUSL2023 Mobile App Development',
                        ),
                        HomeCard(
                          onPress: () {

                          },
                          icon: 'assets/images/Lecture.png',
                          title: 'PUSL2021 Computing Group Project',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/images/Lecture.png',
                          title: 'PUSL2019 Information Management & Retrieval',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/images/Lecture.png',
                          title: 'PUSL2020 Software Development Tools and Practices',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/images/Lecture.png',
                          title: 'BSc (Hons) Software Engineering',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/images/Lecture.png',
                          title: 'PUSL2024 Software Engineering 2',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/images/Lecture.png',
                          title: 'PUSL2022 Introduction to IOT',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      break;
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding / 2),
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
              height: 40.0,
              width: 40.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: kDefaultPadding / 3,
            )
          ],
        ),
      ),
    );
  }
}