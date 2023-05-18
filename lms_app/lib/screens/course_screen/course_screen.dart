import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../constants.dart';
import '../home_screen/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseScreen extends StatelessWidget {
  static String routeName = 'CourseScreen';

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: kTextBlackColor,
        title: const Text('PUSL2023 Mobile App Development'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          },
        ),
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
      body:



      ListView(
        children: [
          ExpansionTile(
            title: Text(
              'Lectures',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),

            children: [
              FutureBuilder<List<String>>(
                future: getFileList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    final fileList = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: fileList.length,
                      itemBuilder: (context, index) {
                        final fileName = fileList[index];
                        return ListTile(
                          title: Text(
                            fileName,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            downloadFile(context, fileName);
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('No files available'),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<String>> getFileList() async {
    final firebase_storage.ListResult result =
    await storage.ref().child('files').listAll();
    return result.items.map((firebase_storage.Reference ref) {
      return ref.name;
    }).toList();
  }

  void downloadFile(BuildContext context, String fileName) async {
    try {
      final String downloadUrl =
      await storage.ref('files/$fileName').getDownloadURL();
      await launch(downloadUrl);
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}