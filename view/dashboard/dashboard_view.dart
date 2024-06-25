import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kind_app/view/dashboard_screen/add_view.dart';
import 'package:kind_app/view/dashboard_screen/home_view.dart';
import 'package:kind_app/view/dashboard_screen/like_view.dart';
import 'package:kind_app/view/dashboard_screen/profile_view.dart';
import 'package:kind_app/view/dashboard_screen/search_view.dart';

class dashboard_view extends StatefulWidget {
  const dashboard_view({super.key});

  @override
  State<dashboard_view> createState() => _dashboard_viewState();
}

class _dashboard_viewState extends State<dashboard_view> {
  int selectedIndex = 0;

  List<Widget> _widgetOptions = [
    HomeView(),
    SearchView(),
    AddView(),
    LikeView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image(
              width: 27,
              height: 27,
              color: Colors.white,
              image: AssetImage("assets/images/home.png"),
            ),
            activeIcon: Image(
              width: 28,
              height: 28,
              color: Colors.blueAccent,
              image: AssetImage("assets/images/home.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              width: 27,
              height: 27,
              color: Colors.white,
              image: AssetImage("assets/images/search.png"),
            ),
            activeIcon: Image(
              width: 27,
              height: 27,
              color: Colors.blueAccent,
              image: AssetImage("assets/images/search.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              width: 27,
              height: 27,
              color: Colors.white,
              image: AssetImage("assets/images/add.png"),
            ),
            activeIcon: Image(
              width: 27,
              height: 27,
              color: Colors.blueAccent,
              image: AssetImage("assets/images/add.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              width: 23,
              height: 23,
              color: Colors.white,
              image: AssetImage("assets/images/heart.png"),
            ),
            activeIcon: Image(
              width: 24,
              height: 24,
              color: Colors.blueAccent,
              image: AssetImage("assets/images/heart.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              width: 24,
              height: 24,
              color: Colors.white,
              image: AssetImage("assets/images/user.png"),
            ),
            activeIcon: Image(
              width: 24,
              height: 24,
              color: Colors.blueAccent,
              image: AssetImage("assets/images/user.png"),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
