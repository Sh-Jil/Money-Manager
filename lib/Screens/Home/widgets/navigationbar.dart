import 'package:flutter/material.dart';
import 'package:moneymanager/Screens/Home/Homescreen.dart';

class Navibar extends StatelessWidget {
  const Navibar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: MyHomePage.indexvalue,
        builder: (BuildContext context, int newindex, Widget? child) {
          return NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: Colors.white.withOpacity(0.2)),
            child: NavigationBar(
                height: kBottomNavigationBarHeight,
                backgroundColor: Colors.white.withOpacity(0.2),
                selectedIndex: newindex,
                onDestinationSelected: (index) {
                  MyHomePage.indexvalue.value = index;
                },
                destinations: const [
                  NavigationDestination(
                      selectedIcon: Icon(Icons.home_filled),
                      icon: Icon(Icons.house_outlined),
                      label: "Transactions"),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.category),
                      icon: Icon(Icons.category_outlined),
                      label: "category")
                ]),
          );
        });
  }
}
