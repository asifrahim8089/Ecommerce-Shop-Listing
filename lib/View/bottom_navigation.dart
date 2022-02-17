// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_project/View/account_screen.dart';
import 'package:task_project/View/cart_screen.dart';
import 'package:task_project/View/home_screen.dart';
import 'package:task_project/View/notification_screen.dart';
import 'package:task_project/View/search_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatefulWidget {
  final index;
  const BottomNavigation({Key key, this.index}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      setState(() {
        _currentIndex = widget.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          HomeScreen(),
          SearchScreen(),
          CartScreen(),
          NotificationScreen(),
          AccountScreen()
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.home,
                size: 20,
                color: Colors.grey,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.home,
                size: 25,
                color: Color.fromARGB(255, 83, 3, 90),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                'assets/svg/search.svg',
                height: 20,
                color: Colors.grey,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                'assets/svg/search.svg',
                height: 25,
                color: Color.fromARGB(255, 83, 3, 90),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                'assets/svg/shopping-cart.svg',
                height: 20,
                color: Colors.grey,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                'assets/svg/shopping-cart.svg',
                height: 25,
                color: Color.fromARGB(255, 83, 3, 90),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.notifications_active_outlined,
                color: Colors.grey,
                size: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.notifications_active_outlined,
                size: 25,
                color: Color.fromARGB(255, 83, 3, 90),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.grey,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.person,
                size: 25,
                color: Color.fromARGB(255, 83, 3, 90),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
