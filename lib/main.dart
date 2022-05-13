import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanager/db/dbmodel.dart';

import 'Screens/Home/Homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(IncomedbAdapter().typeId)) {
    Hive.registerAdapter(IncomedbAdapter());
  }
  if (!Hive.isAdapterRegistered(ExpensedbAdapter().typeId)) {
    Hive.registerAdapter(ExpensedbAdapter());
  }

  await Hive.openBox<Incomedb>('income');
  await Hive.openBox<Expensedb>('expense');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}
