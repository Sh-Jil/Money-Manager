import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'addexpense.dart';
import 'addincome.dart';

void datePicker(context) async {
  final DateTime? newDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 5),
    lastDate: DateTime(DateTime.now().year + 5),
    helpText: 'Select a date',
  );
  String formatter = DateFormat.yMMMMd('en_US').format(newDate!);
  dateExp.text = formatter;
  dateInc.text = formatter;
}
