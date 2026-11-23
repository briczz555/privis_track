// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CacheSnapshotsTable extends CacheSnapshots
    with TableInfo<$CacheSnapshotsTable, CacheSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [cacheKey, payload, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<CacheSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  CacheSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CacheSnapshot(
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CacheSnapshotsTable createAlias(String alias) {
    return $CacheSnapshotsTable(attachedDatabase, alias);
  }
}

class CacheSnapshot extends DataClass implements Insertable<CacheSnapshot> {
  final String cacheKey;
  final String payload;
  final DateTime updatedAt;
  const CacheSnapshot({
    required this.cacheKey,
    required this.payload,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cache_key'] = Variable<String>(cacheKey);
    map['payload'] = Variable<String>(payload);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CacheSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return CacheSnapshotsCompanion(
      cacheKey: Value(cacheKey),
      payload: Value(payload),
      updatedAt: Value(updatedAt),
    );
  }

  factory CacheSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CacheSnapshot(
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      payload: serializer.fromJson<String>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cacheKey': serializer.toJson<String>(cacheKey),
      'payload': serializer.toJson<String>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CacheSnapshot copyWith({
    String? cacheKey,
    String? payload,
    DateTime? updatedAt,
  }) => CacheSnapshot(
    cacheKey: cacheKey ?? this.cacheKey,
    payload: payload ?? this.payload,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CacheSnapshot copyWithCompanion(CacheSnapshotsCompanion data) {
    return CacheSnapshot(
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CacheSnapshot(')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cacheKey, payload, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CacheSnapshot &&
          other.cacheKey == this.cacheKey &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt);
}

class CacheSnapshotsCompanion extends UpdateCompanion<CacheSnapshot> {
  final Value<String> cacheKey;
  final Value<String> payload;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CacheSnapshotsCompanion({
    this.cacheKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CacheSnapshotsCompanion.insert({
    required String cacheKey,
    required String payload,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       payload = Value(payload),
       updatedAt = Value(updatedAt);
  static Insertable<CacheSnapshot> custom({
    Expression<String>? cacheKey,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cacheKey != null) 'cache_key': cacheKey,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CacheSnapshotsCompanion copyWith({
    Value<String>? cacheKey,
    Value<String>? payload,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CacheSnapshotsCompanion(
      cacheKey: cacheKey ?? this.cacheKey,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheSnapshotsCompanion(')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventLinksTable extends CalendarEventLinks
    with TableInfo<$CalendarEventLinksTable, CalendarEventLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _meetingIdMeta = const VerificationMeta(
    'meetingId',
  );
  @override
  late final GeneratedColumn<String> meetingId = GeneratedColumn<String>(
    'meeting_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [meetingId, eventId, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_event_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarEventLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meeting_id')) {
      context.handle(
        _meetingIdMeta,
        meetingId.isAcceptableOrUnknown(data['meeting_id']!, _meetingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_meetingIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {meetingId};
  @override
  CalendarEventLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEventLink(
      meetingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meeting_id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CalendarEventLinksTable createAlias(String alias) {
    return $CalendarEventLinksTable(attachedDatabase, alias);
  }
}

class CalendarEventLink extends DataClass
    implements Insertable<CalendarEventLink> {
  final String meetingId;
  final String eventId;
  final DateTime updatedAt;
  const CalendarEventLink({
    required this.meetingId,
    required this.eventId,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meeting_id'] = Variable<String>(meetingId);
    map['event_id'] = Variable<String>(eventId);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CalendarEventLinksCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventLinksCompanion(
      meetingId: Value(meetingId),
      eventId: Value(eventId),
      updatedAt: Value(updatedAt),
    );
  }

  factory CalendarEventLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEventLink(
      meetingId: serializer.fromJson<String>(json['meetingId']),
      eventId: serializer.fromJson<String>(json['eventId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'meetingId': serializer.toJson<String>(meetingId),
      'eventId': serializer.toJson<String>(eventId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CalendarEventLink copyWith({
    String? meetingId,
    String? eventId,
    DateTime? updatedAt,
  }) => CalendarEventLink(
    meetingId: meetingId ?? this.meetingId,
    eventId: eventId ?? this.eventId,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CalendarEventLink copyWithCompanion(CalendarEventLinksCompanion data) {
    return CalendarEventLink(
      meetingId: data.meetingId.present ? data.meetingId.value : this.meetingId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventLink(')
          ..write('meetingId: $meetingId, ')
          ..write('eventId: $eventId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(meetingId, eventId, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEventLink &&
          other.meetingId == this.meetingId &&
          other.eventId == this.eventId &&
          other.updatedAt == this.updatedAt);
}

class CalendarEventLinksCompanion extends UpdateCompanion<CalendarEventLink> {
  final Value<String> meetingId;
  final Value<String> eventId;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CalendarEventLinksCompanion({
    this.meetingId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventLinksCompanion.insert({
    required String meetingId,
    required String eventId,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : meetingId = Value(meetingId),
       eventId = Value(eventId),
       updatedAt = Value(updatedAt);
  static Insertable<CalendarEventLink> custom({
    Expression<String>? meetingId,
    Expression<String>? eventId,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (meetingId != null) 'meeting_id': meetingId,
      if (eventId != null) 'event_id': eventId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventLinksCompanion copyWith({
    Value<String>? meetingId,
    Value<String>? eventId,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CalendarEventLinksCompanion(
      meetingId: meetingId ?? this.meetingId,
      eventId: eventId ?? this.eventId,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (meetingId.present) {
      map['meeting_id'] = Variable<String>(meetingId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventLinksCompanion(')
          ..write('meetingId: $meetingId, ')
          ..write('eventId: $eventId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CacheSnapshotsTable cacheSnapshots = $CacheSnapshotsTable(this);
  late final $CalendarEventLinksTable calendarEventLinks =
      $CalendarEventLinksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cacheSnapshots,
    calendarEventLinks,
  ];
}

typedef $$CacheSnapshotsTableCreateCompanionBuilder =
    CacheSnapshotsCompanion Function({
      required String cacheKey,
      required String payload,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CacheSnapshotsTableUpdateCompanionBuilder =
    CacheSnapshotsCompanion Function({
      Value<String> cacheKey,
      Value<String> payload,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CacheSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $CacheSnapshotsTable> {
  $$CacheSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CacheSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $CacheSnapshotsTable> {
  $$CacheSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CacheSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CacheSnapshotsTable> {
  $$CacheSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CacheSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CacheSnapshotsTable,
          CacheSnapshot,
          $$CacheSnapshotsTableFilterComposer,
          $$CacheSnapshotsTableOrderingComposer,
          $$CacheSnapshotsTableAnnotationComposer,
          $$CacheSnapshotsTableCreateCompanionBuilder,
          $$CacheSnapshotsTableUpdateCompanionBuilder,
          (
            CacheSnapshot,
            BaseReferences<_$AppDatabase, $CacheSnapshotsTable, CacheSnapshot>,
          ),
          CacheSnapshot,
          PrefetchHooks Function()
        > {
  $$CacheSnapshotsTableTableManager(
    _$AppDatabase db,
    $CacheSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CacheSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CacheSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CacheSnapshotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cacheKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CacheSnapshotsCompanion(
                cacheKey: cacheKey,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cacheKey,
                required String payload,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CacheSnapshotsCompanion.insert(
                cacheKey: cacheKey,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CacheSnapshotsTable, CacheSnapshot>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $CacheSnapshotsTable,
                    CacheSnapshot
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CacheSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CacheSnapshotsTable,
      CacheSnapshot,
      $$CacheSnapshotsTableFilterComposer,
      $$CacheSnapshotsTableOrderingComposer,
      $$CacheSnapshotsTableAnnotationComposer,
      $$CacheSnapshotsTableCreateCompanionBuilder,
      $$CacheSnapshotsTableUpdateCompanionBuilder,
      (
        CacheSnapshot,
        BaseReferences<_$AppDatabase, $CacheSnapshotsTable, CacheSnapshot>,
      ),
      CacheSnapshot,
      PrefetchHooks Function()
    >;
typedef $$CalendarEventLinksTableCreateCompanionBuilder =
    CalendarEventLinksCompanion Function({
      required String meetingId,
      required String eventId,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CalendarEventLinksTableUpdateCompanionBuilder =
    CalendarEventLinksCompanion Function({
      Value<String> meetingId,
      Value<String> eventId,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CalendarEventLinksTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarEventLinksTable> {
  $$CalendarEventLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get meetingId => $composableBuilder(
    column: $table.meetingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventId => $composableBuilder(
    column: $table.eventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarEventLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarEventLinksTable> {
  $$CalendarEventLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get meetingId => $composableBuilder(
    column: $table.meetingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventId => $composableBuilder(
    column: $table.eventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarEventLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarEventLinksTable> {
  $$CalendarEventLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get meetingId =>
      $composableBuilder(column: $table.meetingId, builder: (column) => column);

  GeneratedColumn<String> get eventId =>
      $composableBuilder(column: $table.eventId, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CalendarEventLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalendarEventLinksTable,
          CalendarEventLink,
          $$CalendarEventLinksTableFilterComposer,
          $$CalendarEventLinksTableOrderingComposer,
          $$CalendarEventLinksTableAnnotationComposer,
          $$CalendarEventLinksTableCreateCompanionBuilder,
          $$CalendarEventLinksTableUpdateCompanionBuilder,
          (
            CalendarEventLink,
            BaseReferences<
              _$AppDatabase,
              $CalendarEventLinksTable,
              CalendarEventLink
            >,
          ),
          CalendarEventLink,
          PrefetchHooks Function()
        > {
  $$CalendarEventLinksTableTableManager(
    _$AppDatabase db,
    $CalendarEventLinksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventLinksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> meetingId = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventLinksCompanion(
                meetingId: meetingId,
                eventId: eventId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String meetingId,
                required String eventId,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventLinksCompanion.insert(
                meetingId: meetingId,
                eventId: eventId,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CalendarEventLinksTable, CalendarEventLink>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $CalendarEventLinksTable,
                    CalendarEventLink
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarEventLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalendarEventLinksTable,
      CalendarEventLink,
      $$CalendarEventLinksTableFilterComposer,
      $$CalendarEventLinksTableOrderingComposer,
      $$CalendarEventLinksTableAnnotationComposer,
      $$CalendarEventLinksTableCreateCompanionBuilder,
      $$CalendarEventLinksTableUpdateCompanionBuilder,
      (
        CalendarEventLink,
        BaseReferences<
          _$AppDatabase,
          $CalendarEventLinksTable,
          CalendarEventLink
        >,
      ),
      CalendarEventLink,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CacheSnapshotsTableTableManager get cacheSnapshots =>
      $$CacheSnapshotsTableTableManager(_db, _db.cacheSnapshots);
  $$CalendarEventLinksTableTableManager get calendarEventLinks =>
      $$CalendarEventLinksTableTableManager(_db, _db.calendarEventLinks);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Instance AppDatabase tunggal untuk seluruh aplikasi.

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

/// Instance AppDatabase tunggal untuk seluruh aplikasi.

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Instance AppDatabase tunggal untuk seluruh aplikasi.
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'59cce38d45eeaba199eddd097d8e149d66f9f3e1';
