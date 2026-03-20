import 'package:drift/drift.dart';

class DiaryModel extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title =>  text()();
  TextColumn get body => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}