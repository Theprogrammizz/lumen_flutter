import 'package:drift/drift.dart';

class UserModel extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant("User"))();
  BoolColumn get isDarkMode => boolean().withDefault(const Constant(false))();
}