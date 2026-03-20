// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $UserModelTable extends UserModel
    with TableInfo<$UserModelTable, UserModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("User"),
  );
  static const VerificationMeta _isDarkModeMeta = const VerificationMeta(
    'isDarkMode',
  );
  @override
  late final GeneratedColumn<bool> isDarkMode = GeneratedColumn<bool>(
    'is_dark_mode',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_dark_mode" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, isDarkMode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserModelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('is_dark_mode')) {
      context.handle(
        _isDarkModeMeta,
        isDarkMode.isAcceptableOrUnknown(
          data['is_dark_mode']!,
          _isDarkModeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserModelData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isDarkMode: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_dark_mode'],
      )!,
    );
  }

  @override
  $UserModelTable createAlias(String alias) {
    return $UserModelTable(attachedDatabase, alias);
  }
}

class UserModelData extends DataClass implements Insertable<UserModelData> {
  final int id;
  final String name;
  final bool isDarkMode;
  const UserModelData({
    required this.id,
    required this.name,
    required this.isDarkMode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_dark_mode'] = Variable<bool>(isDarkMode);
    return map;
  }

  UserModelCompanion toCompanion(bool nullToAbsent) {
    return UserModelCompanion(
      id: Value(id),
      name: Value(name),
      isDarkMode: Value(isDarkMode),
    );
  }

  factory UserModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isDarkMode: serializer.fromJson<bool>(json['isDarkMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isDarkMode': serializer.toJson<bool>(isDarkMode),
    };
  }

  UserModelData copyWith({int? id, String? name, bool? isDarkMode}) =>
      UserModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
  UserModelData copyWithCompanion(UserModelCompanion data) {
    return UserModelData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isDarkMode: data.isDarkMode.present
          ? data.isDarkMode.value
          : this.isDarkMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDarkMode: $isDarkMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isDarkMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.isDarkMode == this.isDarkMode);
}

class UserModelCompanion extends UpdateCompanion<UserModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isDarkMode;
  const UserModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isDarkMode = const Value.absent(),
  });
  UserModelCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isDarkMode = const Value.absent(),
  });
  static Insertable<UserModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isDarkMode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isDarkMode != null) 'is_dark_mode': isDarkMode,
    });
  }

  UserModelCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? isDarkMode,
  }) {
    return UserModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isDarkMode.present) {
      map['is_dark_mode'] = Variable<bool>(isDarkMode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDarkMode: $isDarkMode')
          ..write(')'))
        .toString();
  }
}

class $DiaryModelTable extends DiaryModel
    with TableInfo<$DiaryModelTable, DiaryModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, body, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diary_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiaryModelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiaryModelData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DiaryModelTable createAlias(String alias) {
    return $DiaryModelTable(attachedDatabase, alias);
  }
}

class DiaryModelData extends DataClass implements Insertable<DiaryModelData> {
  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  const DiaryModelData({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DiaryModelCompanion toCompanion(bool nullToAbsent) {
    return DiaryModelCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      createdAt: Value(createdAt),
    );
  }

  factory DiaryModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryModelData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DiaryModelData copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? createdAt,
  }) => DiaryModelData(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    createdAt: createdAt ?? this.createdAt,
  );
  DiaryModelData copyWithCompanion(DiaryModelCompanion data) {
    return DiaryModelData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiaryModelData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, body, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryModelData &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.createdAt == this.createdAt);
}

class DiaryModelCompanion extends UpdateCompanion<DiaryModelData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> body;
  final Value<DateTime> createdAt;
  const DiaryModelCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DiaryModelCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String body,
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       body = Value(body);
  static Insertable<DiaryModelData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DiaryModelCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? body,
    Value<DateTime>? createdAt,
  }) {
    return DiaryModelCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryModelCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserModelTable userModel = $UserModelTable(this);
  late final $DiaryModelTable diaryModel = $DiaryModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userModel, diaryModel];
}

typedef $$UserModelTableCreateCompanionBuilder =
    UserModelCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<bool> isDarkMode,
    });
typedef $$UserModelTableUpdateCompanionBuilder =
    UserModelCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<bool> isDarkMode,
    });

class $$UserModelTableFilterComposer
    extends Composer<_$AppDatabase, $UserModelTable> {
  $$UserModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDarkMode => $composableBuilder(
    column: $table.isDarkMode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserModelTableOrderingComposer
    extends Composer<_$AppDatabase, $UserModelTable> {
  $$UserModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDarkMode => $composableBuilder(
    column: $table.isDarkMode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserModelTable> {
  $$UserModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isDarkMode => $composableBuilder(
    column: $table.isDarkMode,
    builder: (column) => column,
  );
}

class $$UserModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserModelTable,
          UserModelData,
          $$UserModelTableFilterComposer,
          $$UserModelTableOrderingComposer,
          $$UserModelTableAnnotationComposer,
          $$UserModelTableCreateCompanionBuilder,
          $$UserModelTableUpdateCompanionBuilder,
          (
            UserModelData,
            BaseReferences<_$AppDatabase, $UserModelTable, UserModelData>,
          ),
          UserModelData,
          PrefetchHooks Function()
        > {
  $$UserModelTableTableManager(_$AppDatabase db, $UserModelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isDarkMode = const Value.absent(),
              }) => UserModelCompanion(
                id: id,
                name: name,
                isDarkMode: isDarkMode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isDarkMode = const Value.absent(),
              }) => UserModelCompanion.insert(
                id: id,
                name: name,
                isDarkMode: isDarkMode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserModelTable,
      UserModelData,
      $$UserModelTableFilterComposer,
      $$UserModelTableOrderingComposer,
      $$UserModelTableAnnotationComposer,
      $$UserModelTableCreateCompanionBuilder,
      $$UserModelTableUpdateCompanionBuilder,
      (
        UserModelData,
        BaseReferences<_$AppDatabase, $UserModelTable, UserModelData>,
      ),
      UserModelData,
      PrefetchHooks Function()
    >;
typedef $$DiaryModelTableCreateCompanionBuilder =
    DiaryModelCompanion Function({
      Value<int> id,
      required String title,
      required String body,
      Value<DateTime> createdAt,
    });
typedef $$DiaryModelTableUpdateCompanionBuilder =
    DiaryModelCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> body,
      Value<DateTime> createdAt,
    });

class $$DiaryModelTableFilterComposer
    extends Composer<_$AppDatabase, $DiaryModelTable> {
  $$DiaryModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiaryModelTableOrderingComposer
    extends Composer<_$AppDatabase, $DiaryModelTable> {
  $$DiaryModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiaryModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiaryModelTable> {
  $$DiaryModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DiaryModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiaryModelTable,
          DiaryModelData,
          $$DiaryModelTableFilterComposer,
          $$DiaryModelTableOrderingComposer,
          $$DiaryModelTableAnnotationComposer,
          $$DiaryModelTableCreateCompanionBuilder,
          $$DiaryModelTableUpdateCompanionBuilder,
          (
            DiaryModelData,
            BaseReferences<_$AppDatabase, $DiaryModelTable, DiaryModelData>,
          ),
          DiaryModelData,
          PrefetchHooks Function()
        > {
  $$DiaryModelTableTableManager(_$AppDatabase db, $DiaryModelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiaryModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiaryModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiaryModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DiaryModelCompanion(
                id: id,
                title: title,
                body: body,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String body,
                Value<DateTime> createdAt = const Value.absent(),
              }) => DiaryModelCompanion.insert(
                id: id,
                title: title,
                body: body,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiaryModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiaryModelTable,
      DiaryModelData,
      $$DiaryModelTableFilterComposer,
      $$DiaryModelTableOrderingComposer,
      $$DiaryModelTableAnnotationComposer,
      $$DiaryModelTableCreateCompanionBuilder,
      $$DiaryModelTableUpdateCompanionBuilder,
      (
        DiaryModelData,
        BaseReferences<_$AppDatabase, $DiaryModelTable, DiaryModelData>,
      ),
      DiaryModelData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserModelTableTableManager get userModel =>
      $$UserModelTableTableManager(_db, _db.userModel);
  $$DiaryModelTableTableManager get diaryModel =>
      $$DiaryModelTableTableManager(_db, _db.diaryModel);
}
