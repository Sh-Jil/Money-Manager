import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanager/db/dbmodel.dart';

void addtoexpense(Expensedb value) async {
  var box = await Hive.openBox<Expensedb>('expense');
  var id = await box.add(value);
  value.id = id;
}

void removefromexpense(int id) async {
  var box = await Hive.openBox<Expensedb>('expense');
  box.delete(id);
}

void editexpense(Expensedb value, int id) async {
  var box = await Hive.openBox<Expensedb>('expense');
  box.put(id, value);
}
