import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumen_flutter/database/app_db.dart';

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase(),);

final userProvider = StreamProvider<UserModelData?>((ref) {
  return ref.watch(dbProvider).watchUser();
},);

final diaryProvider = StreamProvider<List<DiaryModelData>>((ref) {
  return ref.watch(dbProvider).watchDiary();
},);