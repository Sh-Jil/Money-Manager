import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moneymanager/Screens/Transactions/Income.dart';
import 'package:moneymanager/Screens/Transactions/expense.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/Screens/Transactions/widgets/fab.dart';

final now = DateTime.now();
String formatter = DateFormat.yMMMMd('en_US').format(now);
const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  bool isFab = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                setState(() => isFab = true);
              } else if (notification.direction == ScrollDirection.reverse) {
                setState(() => isFab = false);
              }
              return true;
            },
            child: SafeArea(
                child: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverAppBar(
                            flexibleSpace: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 189, 117, 202),
                              Colors.blueAccent,
                              Colors.lightBlueAccent
                            ]))),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            pinned: true,
                            floating: true,
                            snap: true,
                            centerTitle: true,
                            title: const Text(
                              "Money Manager",
                              style: TextStyle(letterSpacing: 1.5),
                              strutStyle: StrutStyle(
                                  fontSize: 20, fontStyle: FontStyle.normal),
                            ),
                            bottom: PreferredSize(
                              preferredSize:
                                  const Size.fromHeight(kToolbarHeight + 16.0),
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    shape: BoxShape.rectangle,
                                    color: Colors.white.withOpacity(0.3)),
                                child: TabBar(
                                    indicator: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(255, 189, 117, 202),
                                          Colors.blueAccent,
                                          Colors.lightBlueAccent
                                        ])),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    tabs: const [
                                      Tab(
                                        child: Text(
                                          "Income",
                                          style: TextStyle(
                                              fontSize: 18, letterSpacing: 1.5),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          "Expense",
                                          style: TextStyle(
                                              fontSize: 18, letterSpacing: 1.5),
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          )
                        ],
                    body: const TabBarView(children: [Income(), Expense()])))),
        floatingActionButton: isFab ? const Fab() : null,
      ),
    );
  }
}
