import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:moneymanager/Screens/Transactions/Methods/addincome.dart';

import '../Methods/addexpense.dart';

class Fab extends StatelessWidget {
  const Fab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 189, 117, 202),
          Colors.blueAccent,
          Colors.lightBlueAccent
        ]),
        gradientBoxShape: BoxShape.circle,
        overlayOpacity: 0.6,
        overlayColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              onTap: (() => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddExpense()))),
              labelStyle: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500),
              label: "Add Expense",
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 189, 117, 202),
                      Colors.blueAccent,
                      Colors.lightBlueAccent
                    ])),
                child: const Center(
                  child: Icon(
                    Icons.money_rounded,
                    size: 40.0,
                  ),
                ),
              )),
          SpeedDialChild(
              onTap: (() => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddIncome()))),
              label: "Add Income",
              labelStyle: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 189, 117, 202),
                      Colors.blueAccent,
                      Colors.lightBlueAccent
                    ])),
                child: const Icon(
                  Icons.attach_money,
                  size: 40.0,
                ),
              ))
        ]);
  }
}
