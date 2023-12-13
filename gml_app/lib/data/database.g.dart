// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TaskItemsTable extends TaskItems
    with TableInfo<$TaskItemsTable, TaskItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, points];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_items';
  @override
  VerificationContext validateIntegrity(Insertable<TaskItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
    );
  }

  @override
  $TaskItemsTable createAlias(String alias) {
    return $TaskItemsTable(attachedDatabase, alias);
  }
}

class TaskItem extends DataClass implements Insertable<TaskItem> {
  final int id;
  final String title;
  final int points;
  const TaskItem({required this.id, required this.title, required this.points});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['points'] = Variable<int>(points);
    return map;
  }

  TaskItemsCompanion toCompanion(bool nullToAbsent) {
    return TaskItemsCompanion(
      id: Value(id),
      title: Value(title),
      points: Value(points),
    );
  }

  factory TaskItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      points: serializer.fromJson<int>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'points': serializer.toJson<int>(points),
    };
  }

  TaskItem copyWith({int? id, String? title, int? points}) => TaskItem(
        id: id ?? this.id,
        title: title ?? this.title,
        points: points ?? this.points,
      );
  @override
  String toString() {
    return (StringBuffer('TaskItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.points == this.points);
}

class TaskItemsCompanion extends UpdateCompanion<TaskItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> points;
  const TaskItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.points = const Value.absent(),
  });
  TaskItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int points,
  })  : title = Value(title),
        points = Value(points);
  static Insertable<TaskItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (points != null) 'points': points,
    });
  }

  TaskItemsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<int>? points}) {
    return TaskItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      points: points ?? this.points,
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
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
}

class $GoalItemsTable extends GoalItems
    with TableInfo<$GoalItemsTable, GoalItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, points];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_items';
  @override
  VerificationContext validateIntegrity(Insertable<GoalItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
    );
  }

  @override
  $GoalItemsTable createAlias(String alias) {
    return $GoalItemsTable(attachedDatabase, alias);
  }
}

class GoalItem extends DataClass implements Insertable<GoalItem> {
  final int id;
  final String title;
  final int points;
  const GoalItem({required this.id, required this.title, required this.points});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['points'] = Variable<int>(points);
    return map;
  }

  GoalItemsCompanion toCompanion(bool nullToAbsent) {
    return GoalItemsCompanion(
      id: Value(id),
      title: Value(title),
      points: Value(points),
    );
  }

  factory GoalItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      points: serializer.fromJson<int>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'points': serializer.toJson<int>(points),
    };
  }

  GoalItem copyWith({int? id, String? title, int? points}) => GoalItem(
        id: id ?? this.id,
        title: title ?? this.title,
        points: points ?? this.points,
      );
  @override
  String toString() {
    return (StringBuffer('GoalItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.points == this.points);
}

class GoalItemsCompanion extends UpdateCompanion<GoalItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> points;
  const GoalItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.points = const Value.absent(),
  });
  GoalItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int points,
  })  : title = Value(title),
        points = Value(points);
  static Insertable<GoalItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (points != null) 'points': points,
    });
  }

  GoalItemsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<int>? points}) {
    return GoalItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      points: points ?? this.points,
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
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
}

class $UserPointsTable extends UserPoints
    with TableInfo<$UserPointsTable, UserPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, points];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_points';
  @override
  VerificationContext validateIntegrity(Insertable<UserPoint> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPoint(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
    );
  }

  @override
  $UserPointsTable createAlias(String alias) {
    return $UserPointsTable(attachedDatabase, alias);
  }
}

class UserPoint extends DataClass implements Insertable<UserPoint> {
  final int id;
  final int points;
  const UserPoint({required this.id, required this.points});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['points'] = Variable<int>(points);
    return map;
  }

  UserPointsCompanion toCompanion(bool nullToAbsent) {
    return UserPointsCompanion(
      id: Value(id),
      points: Value(points),
    );
  }

  factory UserPoint.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPoint(
      id: serializer.fromJson<int>(json['id']),
      points: serializer.fromJson<int>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'points': serializer.toJson<int>(points),
    };
  }

  UserPoint copyWith({int? id, int? points}) => UserPoint(
        id: id ?? this.id,
        points: points ?? this.points,
      );
  @override
  String toString() {
    return (StringBuffer('UserPoint(')
          ..write('id: $id, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPoint &&
          other.id == this.id &&
          other.points == this.points);
}

class UserPointsCompanion extends UpdateCompanion<UserPoint> {
  final Value<int> id;
  final Value<int> points;
  const UserPointsCompanion({
    this.id = const Value.absent(),
    this.points = const Value.absent(),
  });
  UserPointsCompanion.insert({
    this.id = const Value.absent(),
    required int points,
  }) : points = Value(points);
  static Insertable<UserPoint> custom({
    Expression<int>? id,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (points != null) 'points': points,
    });
  }

  UserPointsCompanion copyWith({Value<int>? id, Value<int>? points}) {
    return UserPointsCompanion(
      id: id ?? this.id,
      points: points ?? this.points,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPointsCompanion(')
          ..write('id: $id, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TaskItemsTable taskItems = $TaskItemsTable(this);
  late final $GoalItemsTable goalItems = $GoalItemsTable(this);
  late final $UserPointsTable userPoints = $UserPointsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [taskItems, goalItems, userPoints];
}
