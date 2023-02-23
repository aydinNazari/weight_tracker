import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/screen/add_page.dart';
import 'package:flutter_weight_tracker/screen/graph.dart';
import 'package:flutter_weight_tracker/screen/history.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<IconData> iconList = [Icons.show_chart, Icons.history];

  int _bottomNavIndex = 0;
  Widget currentScreen = const GraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff32e842),
        onPressed: () {
            Navigator.push(context, PageTransition(
              child: AddPage(),
              type:PageTransitionType.bottomToTop
            ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        height: Get.height / 12,
        iconSize: 25,
        activeIndex: _bottomNavIndex,
        backgroundColor: const Color(0xff193642),
        gapLocation: GapLocation.center,
        activeColor: const Color(0xff32e842),
        inactiveColor: Colors.grey,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          setState(
            () {
              _bottomNavIndex = index;
              index == 0
                  ? currentScreen = const GraphScreen()
                  : currentScreen = const History();
            },
          );
        },
      ),
    );
  }
}
