import 'package:flutter/material.dart';
import 'package:moneymanager/Screens/Categories/category.dart';
import 'package:moneymanager/Screens/Transactions/transaction.dart';
import 'widgets/navigationbar.dart';

const pages = [Transaction(), Category()];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static ValueNotifier<int> indexvalue = ValueNotifier(0);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 189, 117, 202),
        Colors.blueAccent,
        Colors.lightBlueAccent
      ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: const Navibar(),
          body: SafeArea(
              child: ValueListenableBuilder(
                  valueListenable: MyHomePage.indexvalue,
                  builder: (BuildContext context, int indexvalue, Widget? _) {
                    return pages[indexvalue];
                  }))),
    );
  }
}
