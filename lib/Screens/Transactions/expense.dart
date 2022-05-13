import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/Screens/Transactions/detailscreen.dart';
import 'package:moneymanager/db/dbmodel.dart';

class Expense extends StatelessWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Expensedb>('expense').listenable(),
          builder:
              (BuildContext context, Box<Expensedb> newexpense, Widget? _) {
            if (newexpense.isEmpty) {
              return const Center(
                child: Text("Add Expense Data to shown here"),
              );
            } else {
              return GroupedListView<Expensedb, DateTime>(
                  elements: newexpense.values.toList(),
                  groupBy: (element) =>
                      DateFormat.yMMMMd('en_US').parse(element.date),
                  groupHeaderBuilder: (groupByValue) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 189, 117, 202),
                            Colors.blueAccent,
                            Colors.lightBlueAccent
                          ])),
                      child: Text(
                        groupByValue.date,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 1.2),
                      ),
                      padding: const EdgeInsets.all(8.0),
                    );
                  },
                  order: GroupedListOrder.DESC,
                  itemBuilder: (context, dynamic element) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.grey.withOpacity(0.6)),
                        child: ListTile(
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                                amount: "- ${element!.amount}",
                                categorystring: element.categorystring,
                                date: element.date,
                                description: element.description,
                                id: element.id);
                          })),
                          minVerticalPadding: 10.0,
                          minLeadingWidth: 50.0,
                          horizontalTitleGap: 30.0,
                          visualDensity: VisualDensity.comfortable,
                          leading: const CircleAvatar(
                            radius: 25.0,
                          ),
                          trailing: Text(
                            "- ₹${element!.amount}",
                            style: const TextStyle(
                                color: Colors.red,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          title: Text(
                            element.categorystring,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.fade,
                                leadingDistribution:
                                    TextLeadingDistribution.proportional,
                                letterSpacing: 1.0),
                          ),
                          subtitle: Text(element.date.toString()),
                        ),
                      ));
            }
          }),
    );
  }
}
