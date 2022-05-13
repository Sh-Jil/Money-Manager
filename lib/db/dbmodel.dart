import 'package:hive_flutter/hive_flutter.dart';
part 'dbmodel.g.dart';

@HiveType(typeId: 0)
class Incomedb extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String amount;

  @HiveField(2)
  final String categorystring;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final String date;

  Incomedb(
      {this.id,
      required this.amount,
      required this.categorystring,
      required this.date,
      required this.description});
}

@HiveType(typeId: 1)
class Expensedb extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String amount;

  @HiveField(2)
  final String categorystring;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final String date;

  Expensedb(
      {this.id,
      required this.amount,
      required this.categorystring,
      required this.date,
      required this.description});
}
