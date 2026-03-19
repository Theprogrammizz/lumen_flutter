import 'package:drift/drift.dart';

class UserSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant('User'))();
  BoolColumn get isDark => boolean().withDefault(const Constant(false))();
}
