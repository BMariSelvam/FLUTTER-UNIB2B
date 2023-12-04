import 'package:flutter/material.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Screens/DashBoard/dashboardscreen.dart';

import '../../Const/assets.dart';
import '../Master/Master DashBoard Screen.dart';
import '../Purchase/Purchase DashBoard Screen.dart';
import '../Sales/Sales DashBoard Screen.dart';
import '../Settings/Setting Screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashBoardScreen(),
    MasterScreen(),
    SalesScreen(),
    PurchaseScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.primaryCustom,
        iconSize: 90,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.home, scale: 3),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.homeClick, scale: 3),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.master, scale: 3),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.masterClick, scale: 3),
            ),
            label: 'Master',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.sales, scale: 3),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.salesClick, scale: 3),
            ),
            label: 'Sales',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.purchase, scale: 3),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.purchaseClick, scale: 3),
            ),
            label: 'Purchase',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.setting, scale: 3),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.settingsClick, scale: 3),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.white,
        unselectedItemColor: MyColors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
