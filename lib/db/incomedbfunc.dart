import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanager/db/dbmodel.dart';

void addtoincome(Incomedb value) async {
  var box = await Hive.openBox<Incomedb>('income');
  var id = await box.add(value);
  value.id = id;
}

void removefromincome(int id) async {
  var box = await Hive.openBox<Incomedb>('income');
  box.delete(id);
}

void editincome(Incomedb value, int id) async {
  var box = await Hive.openBox<Incomedb>('income');
  box.put(id, value);
}
