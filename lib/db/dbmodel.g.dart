// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomedbAdapter extends TypeAdapter<Incomedb> {
  @override
  final int typeId = 0;

  @override
  Incomedb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Incomedb(
      id: fields[0] as int?,
      amount: fields[1] as String,
      categorystring: fields[2] as String,
      date: fields[5] as String,
      description: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Incomedb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.categorystring)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomedbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExpensedbAdapter extends TypeAdapter<Expensedb> {
  @override
  final int typeId = 1;

  @override
  Expensedb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expensedb(
      id: fields[0] as int?,
      amount: fields[1] as String,
      categorystring: fields[2] as String,
      date: fields[5] as String,
      description: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Expensedb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.categorystring)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensedbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
