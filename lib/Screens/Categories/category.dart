import 'package:flutter/material.dart';
import 'package:moneymanager/Screens/Categories/expensecatscreen.dart';
import 'package:moneymanager/Screens/Categories/incomecatscreen.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 189, 117, 202),
                Colors.blueAccent,
                Colors.lightBlueAccent
              ]),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                TabBar(
                  tabs: [
                    Tab(
                      text: "Income",
                    ),
                    Tab(
                      text: "Expense",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(children: [InCat(), ExCat()]),
      ),
    );
  }
}
