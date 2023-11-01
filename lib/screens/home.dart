import '../screens/news.dart';
import '../screens/notification.dart';
import '../screens/profile.dart';
import '../screens/search.dart';
import '../constants/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // final int index;
  const Home({super.key,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screenS = [
    const News(),
    const SearchView(),
    const Notification1(),
    const ProfileView(),
  ];
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ind,
          onTap: (value) {
            setState(() {
              ind = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppStyle.background_S,
          elevation: 1.0,
          unselectedItemColor: AppStyle.grey_t,
          selectedItemColor: AppStyle.lime_t,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: homeSvg,
              activeIcon: homeSvgA,
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: searchSvg,
              activeIcon: searchSvgA,
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: notificationSvg,
              activeIcon: notificationSvgA,
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: profileSvg,
              activeIcon: profileSvgA,
              label: "Profile",
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: screenS[ind],
        ),
      ),
    );
  }
}
