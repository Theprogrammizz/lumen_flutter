import 'dart:io';

import 'package:drift/drift.dart';
import 'package:lumen_flutter/database/tables/diary_model.dart';
import 'package:lumen_flutter/database/tables/user_model.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [UserModel, DiaryModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openDatabase());

  @override
  int get schemaVersion => 1;

  // User Settings

  Future<UserModelData?> getUser() async {
    return await select(userModel).getSingleOrNull();
  }

  Stream<UserModelData?> watchUser() {
    return select(userModel).watchSingleOrNull();
  }
  
  Future<void> updateName(String name) async {
  final user = await getUser();
  if (user != null) {
    await update(userModel).replace(user.copyWith(name: name));
  }
}

  Future<void> createUser(String name) async{
    await into(userModel).insert(UserModelCompanion(name: Value(name)));
  }

  Future<void> toggleTheme (bool value) async{
    final user = await getUser();
    if (user != null) {
      await update(userModel).replace(user.copyWith(isDarkMode: value),);
    }
  }

  // Diary Methods

  Future<void> addDiary(String title, String body) async{
    await into(diaryModel).insert(DiaryModelCompanion.insert(title: title, body: body));
  }

  Stream<List<DiaryModelData>> watchDiary() {
    return (select(diaryModel)..orderBy([(e) => OrderingTerm.desc(e.createdAt)])).watch();
  }

  Future<void> deleteDiary(int id) async {
    await (delete(diaryModel)..where((e) => e.id.equals(id))).go();
  }
 }

LazyDatabase _openDatabase() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'diary.sqlite'));
    return NativeDatabase(file);
  });
}