import 'package:flutter/material.dart';
import 'package:moneymanager/db/expensedbfunc.dart';
import 'package:moneymanager/db/incomedbfunc.dart';

import '../Home/homescreen.dart';

class DetailScreen extends StatelessWidget {
  final String amount;
  final String categorystring;
  final String date;
  final String? description;
  final int? id;
  const DetailScreen(
      {Key? key,
      required this.amount,
      required this.categorystring,
      required this.date,
      required this.description,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              if (amount.startsWith("+")) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                    (route) => false);
                removefromincome(id!.toInt());
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                    (route) => false);
                removefromexpense(id!);
              }
            },
          ),
        ],
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              amount,
              style: TextStyle(
                  color: amount.startsWith('+') ? Colors.green : Colors.red,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(date),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Text(categorystring, style: const TextStyle(fontSize: 15)),
            color: Colors.grey,
            padding: const EdgeInsets.all(16.0),
          ),
          Container(
            child: Text(description!),
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
    );
  }
}
