// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProgramDtosTable extends ProgramDtos
    with TableInfo<$ProgramDtosTable, ProgramDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramDtosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _programTitleMeta =
      const VerificationMeta('programTitle');
  @override
  late final GeneratedColumn<String> programTitle = GeneratedColumn<String>(
      'program_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _programUidMeta =
      const VerificationMeta('programUid');
  @override
  late final GeneratedColumn<String> programUid = GeneratedColumn<String>(
      'program_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _programDescriptionMeta =
      const VerificationMeta('programDescription');
  @override
  late final GeneratedColumn<String> programDescription =
      GeneratedColumn<String>('program_description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _programTimeInSecondsMeta =
      const VerificationMeta('programTimeInSeconds');
  @override
  late final GeneratedColumn<int> programTimeInSeconds = GeneratedColumn<int>(
      'program_time_in_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _progressedProgramTimeInSecondsMeta =
      const VerificationMeta('progressedProgramTimeInSeconds');
  @override
  late final GeneratedColumn<int> progressedProgramTimeInSeconds =
      GeneratedColumn<int>(
          'progressed_program_time_in_seconds', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _programHistoryUidMeta =
      const VerificationMeta('programHistoryUid');
  @override
  late final GeneratedColumn<String> programHistoryUid =
      GeneratedColumn<String>('program_history_uid', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        programTitle,
        programUid,
        programDescription,
        startedAt,
        programTimeInSeconds,
        progressedProgramTimeInSeconds,
        programHistoryUid
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'program_dtos';
  @override
  VerificationContext validateIntegrity(Insertable<ProgramDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('program_title')) {
      context.handle(
          _programTitleMeta,
          programTitle.isAcceptableOrUnknown(
              data['program_title']!, _programTitleMeta));
    } else if (isInserting) {
      context.missing(_programTitleMeta);
    }
    if (data.containsKey('program_uid')) {
      context.handle(
          _programUidMeta,
          programUid.isAcceptableOrUnknown(
              data['program_uid']!, _programUidMeta));
    } else if (isInserting) {
      context.missing(_programUidMeta);
    }
    if (data.containsKey('program_description')) {
      context.handle(
          _programDescriptionMeta,
          programDescription.isAcceptableOrUnknown(
              data['program_description']!, _programDescriptionMeta));
    } else if (isInserting) {
      context.missing(_programDescriptionMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('program_time_in_seconds')) {
      context.handle(
          _programTimeInSecondsMeta,
          programTimeInSeconds.isAcceptableOrUnknown(
              data['program_time_in_seconds']!, _programTimeInSecondsMeta));
    } else if (isInserting) {
      context.missing(_programTimeInSecondsMeta);
    }
    if (data.containsKey('progressed_program_time_in_seconds')) {
      context.handle(
          _progressedProgramTimeInSecondsMeta,
          progressedProgramTimeInSeconds.isAcceptableOrUnknown(
              data['progressed_program_time_in_seconds']!,
              _progressedProgramTimeInSecondsMeta));
    } else if (isInserting) {
      context.missing(_progressedProgramTimeInSecondsMeta);
    }
    if (data.containsKey('program_history_uid')) {
      context.handle(
          _programHistoryUidMeta,
          programHistoryUid.isAcceptableOrUnknown(
              data['program_history_uid']!, _programHistoryUidMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProgramDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramDto(
      programTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}program_title'])!,
      programUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}program_uid'])!,
      programDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}program_description'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at']),
      programTimeInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}program_time_in_seconds'])!,
      progressedProgramTimeInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}progressed_program_time_in_seconds'])!,
      programHistoryUid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}program_history_uid']),
    );
  }

  @override
  $ProgramDtosTable createAlias(String alias) {
    return $ProgramDtosTable(attachedDatabase, alias);
  }
}

class ProgramDto extends DataClass implements Insertable<ProgramDto> {
  final String programTitle;
  final String programUid;
  final String programDescription;
  final DateTime? startedAt;
  final int programTimeInSeconds;
  final int progressedProgramTimeInSeconds;
  final String? programHistoryUid;
  const ProgramDto(
      {required this.programTitle,
      required this.programUid,
      required this.programDescription,
      this.startedAt,
      required this.programTimeInSeconds,
      required this.progressedProgramTimeInSeconds,
      this.programHistoryUid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['program_title'] = Variable<String>(programTitle);
    map['program_uid'] = Variable<String>(programUid);
    map['program_description'] = Variable<String>(programDescription);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    map['program_time_in_seconds'] = Variable<int>(programTimeInSeconds);
    map['progressed_program_time_in_seconds'] =
        Variable<int>(progressedProgramTimeInSeconds);
    if (!nullToAbsent || programHistoryUid != null) {
      map['program_history_uid'] = Variable<String>(programHistoryUid);
    }
    return map;
  }

  ProgramDtosCompanion toCompanion(bool nullToAbsent) {
    return ProgramDtosCompanion(
      programTitle: Value(programTitle),
      programUid: Value(programUid),
      programDescription: Value(programDescription),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      programTimeInSeconds: Value(programTimeInSeconds),
      progressedProgramTimeInSeconds: Value(progressedProgramTimeInSeconds),
      programHistoryUid: programHistoryUid == null && nullToAbsent
          ? const Value.absent()
          : Value(programHistoryUid),
    );
  }

  factory ProgramDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramDto(
      programTitle: serializer.fromJson<String>(json['programTitle']),
      programUid: serializer.fromJson<String>(json['programUid']),
      programDescription:
          serializer.fromJson<String>(json['programDescription']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      programTimeInSeconds:
          serializer.fromJson<int>(json['programTimeInSeconds']),
      progressedProgramTimeInSeconds:
          serializer.fromJson<int>(json['progressedProgramTimeInSeconds']),
      programHistoryUid:
          serializer.fromJson<String?>(json['programHistoryUid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'programTitle': serializer.toJson<String>(programTitle),
      'programUid': serializer.toJson<String>(programUid),
      'programDescription': serializer.toJson<String>(programDescription),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'programTimeInSeconds': serializer.toJson<int>(programTimeInSeconds),
      'progressedProgramTimeInSeconds':
          serializer.toJson<int>(progressedProgramTimeInSeconds),
      'programHistoryUid': serializer.toJson<String?>(programHistoryUid),
    };
  }

  ProgramDto copyWith(
          {String? programTitle,
          String? programUid,
          String? programDescription,
          Value<DateTime?> startedAt = const Value.absent(),
          int? programTimeInSeconds,
          int? progressedProgramTimeInSeconds,
          Value<String?> programHistoryUid = const Value.absent()}) =>
      ProgramDto(
        programTitle: programTitle ?? this.programTitle,
        programUid: programUid ?? this.programUid,
        programDescription: programDescription ?? this.programDescription,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        programTimeInSeconds: programTimeInSeconds ?? this.programTimeInSeconds,
        progressedProgramTimeInSeconds: progressedProgramTimeInSeconds ??
            this.progressedProgramTimeInSeconds,
        programHistoryUid: programHistoryUid.present
            ? programHistoryUid.value
            : this.programHistoryUid,
      );
  ProgramDto copyWithCompanion(ProgramDtosCompanion data) {
    return ProgramDto(
      programTitle: data.programTitle.present
          ? data.programTitle.value
          : this.programTitle,
      programUid:
          data.programUid.present ? data.programUid.value : this.programUid,
      programDescription: data.programDescription.present
          ? data.programDescription.value
          : this.programDescription,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      programTimeInSeconds: data.programTimeInSeconds.present
          ? data.programTimeInSeconds.value
          : this.programTimeInSeconds,
      progressedProgramTimeInSeconds:
          data.progressedProgramTimeInSeconds.present
              ? data.progressedProgramTimeInSeconds.value
              : this.progressedProgramTimeInSeconds,
      programHistoryUid: data.programHistoryUid.present
          ? data.programHistoryUid.value
          : this.programHistoryUid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramDto(')
          ..write('programTitle: $programTitle, ')
          ..write('programUid: $programUid, ')
          ..write('programDescription: $programDescription, ')
          ..write('startedAt: $startedAt, ')
          ..write('programTimeInSeconds: $programTimeInSeconds, ')
          ..write(
              'progressedProgramTimeInSeconds: $progressedProgramTimeInSeconds, ')
          ..write('programHistoryUid: $programHistoryUid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      programTitle,
      programUid,
      programDescription,
      startedAt,
      programTimeInSeconds,
      progressedProgramTimeInSeconds,
      programHistoryUid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramDto &&
          other.programTitle == this.programTitle &&
          other.programUid == this.programUid &&
          other.programDescription == this.programDescription &&
          other.startedAt == this.startedAt &&
          other.programTimeInSeconds == this.programTimeInSeconds &&
          other.progressedProgramTimeInSeconds ==
              this.progressedProgramTimeInSeconds &&
          other.programHistoryUid == this.programHistoryUid);
}

class ProgramDtosCompanion extends UpdateCompanion<ProgramDto> {
  final Value<String> programTitle;
  final Value<String> programUid;
  final Value<String> programDescription;
  final Value<DateTime?> startedAt;
  final Value<int> programTimeInSeconds;
  final Value<int> progressedProgramTimeInSeconds;
  final Value<String?> programHistoryUid;
  final Value<int> rowid;
  const ProgramDtosCompanion({
    this.programTitle = const Value.absent(),
    this.programUid = const Value.absent(),
    this.programDescription = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.programTimeInSeconds = const Value.absent(),
    this.progressedProgramTimeInSeconds = const Value.absent(),
    this.programHistoryUid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramDtosCompanion.insert({
    required String programTitle,
    required String programUid,
    required String programDescription,
    this.startedAt = const Value.absent(),
    required int programTimeInSeconds,
    required int progressedProgramTimeInSeconds,
    this.programHistoryUid = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : programTitle = Value(programTitle),
        programUid = Value(programUid),
        programDescription = Value(programDescription),
        programTimeInSeconds = Value(programTimeInSeconds),
        progressedProgramTimeInSeconds = Value(progressedProgramTimeInSeconds);
  static Insertable<ProgramDto> custom({
    Expression<String>? programTitle,
    Expression<String>? programUid,
    Expression<String>? programDescription,
    Expression<DateTime>? startedAt,
    Expression<int>? programTimeInSeconds,
    Expression<int>? progressedProgramTimeInSeconds,
    Expression<String>? programHistoryUid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (programTitle != null) 'program_title': programTitle,
      if (programUid != null) 'program_uid': programUid,
      if (programDescription != null) 'program_description': programDescription,
      if (startedAt != null) 'started_at': startedAt,
      if (programTimeInSeconds != null)
        'program_time_in_seconds': programTimeInSeconds,
      if (progressedProgramTimeInSeconds != null)
        'progressed_program_time_in_seconds': progressedProgramTimeInSeconds,
      if (programHistoryUid != null) 'program_history_uid': programHistoryUid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramDtosCompanion copyWith(
      {Value<String>? programTitle,
      Value<String>? programUid,
      Value<String>? programDescription,
      Value<DateTime?>? startedAt,
      Value<int>? programTimeInSeconds,
      Value<int>? progressedProgramTimeInSeconds,
      Value<String?>? programHistoryUid,
      Value<int>? rowid}) {
    return ProgramDtosCompanion(
      programTitle: programTitle ?? this.programTitle,
      programUid: programUid ?? this.programUid,
      programDescription: programDescription ?? this.programDescription,
      startedAt: startedAt ?? this.startedAt,
      programTimeInSeconds: programTimeInSeconds ?? this.programTimeInSeconds,
      progressedProgramTimeInSeconds:
          progressedProgramTimeInSeconds ?? this.progressedProgramTimeInSeconds,
      programHistoryUid: programHistoryUid ?? this.programHistoryUid,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (programTitle.present) {
      map['program_title'] = Variable<String>(programTitle.value);
    }
    if (programUid.present) {
      map['program_uid'] = Variable<String>(programUid.value);
    }
    if (programDescription.present) {
      map['program_description'] = Variable<String>(programDescription.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (programTimeInSeconds.present) {
      map['program_time_in_seconds'] =
          Variable<int>(programTimeInSeconds.value);
    }
    if (progressedProgramTimeInSeconds.present) {
      map['progressed_program_time_in_seconds'] =
          Variable<int>(progressedProgramTimeInSeconds.value);
    }
    if (programHistoryUid.present) {
      map['program_history_uid'] = Variable<String>(programHistoryUid.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramDtosCompanion(')
          ..write('programTitle: $programTitle, ')
          ..write('programUid: $programUid, ')
          ..write('programDescription: $programDescription, ')
          ..write('startedAt: $startedAt, ')
          ..write('programTimeInSeconds: $programTimeInSeconds, ')
          ..write(
              'progressedProgramTimeInSeconds: $progressedProgramTimeInSeconds, ')
          ..write('programHistoryUid: $programHistoryUid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionDtosTable extends SessionDtos
    with TableInfo<$SessionDtosTable, SessionDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionDtosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionUidMeta =
      const VerificationMeta('sessionUid');
  @override
  late final GeneratedColumn<String> sessionUid = GeneratedColumn<String>(
      'session_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionTitleMeta =
      const VerificationMeta('sessionTitle');
  @override
  late final GeneratedColumn<String> sessionTitle = GeneratedColumn<String>(
      'session_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _progressedSessionTimeInSecondsMeta =
      const VerificationMeta('progressedSessionTimeInSeconds');
  @override
  late final GeneratedColumn<int> progressedSessionTimeInSeconds =
      GeneratedColumn<int>(
          'progressed_session_time_in_seconds', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sessionTimeInSecondsMeta =
      const VerificationMeta('sessionTimeInSeconds');
  @override
  late final GeneratedColumn<int> sessionTimeInSeconds = GeneratedColumn<int>(
      'session_time_in_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sessionPriorityMeta =
      const VerificationMeta('sessionPriority');
  @override
  late final GeneratedColumn<int> sessionPriority = GeneratedColumn<int>(
      'session_priority', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sessionMemoMeta =
      const VerificationMeta('sessionMemo');
  @override
  late final GeneratedColumn<String> sessionMemo = GeneratedColumn<String>(
      'session_memo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _programUidMeta =
      const VerificationMeta('programUid');
  @override
  late final GeneratedColumn<String> programUid = GeneratedColumn<String>(
      'program_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        sessionUid,
        sessionTitle,
        progressedSessionTimeInSeconds,
        sessionTimeInSeconds,
        sessionPriority,
        sessionMemo,
        programUid
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_dtos';
  @override
  VerificationContext validateIntegrity(Insertable<SessionDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_uid')) {
      context.handle(
          _sessionUidMeta,
          sessionUid.isAcceptableOrUnknown(
              data['session_uid']!, _sessionUidMeta));
    } else if (isInserting) {
      context.missing(_sessionUidMeta);
    }
    if (data.containsKey('session_title')) {
      context.handle(
          _sessionTitleMeta,
          sessionTitle.isAcceptableOrUnknown(
              data['session_title']!, _sessionTitleMeta));
    } else if (isInserting) {
      context.missing(_sessionTitleMeta);
    }
    if (data.containsKey('progressed_session_time_in_seconds')) {
      context.handle(
          _progressedSessionTimeInSecondsMeta,
          progressedSessionTimeInSeconds.isAcceptableOrUnknown(
              data['progressed_session_time_in_seconds']!,
              _progressedSessionTimeInSecondsMeta));
    } else if (isInserting) {
      context.missing(_progressedSessionTimeInSecondsMeta);
    }
    if (data.containsKey('session_time_in_seconds')) {
      context.handle(
          _sessionTimeInSecondsMeta,
          sessionTimeInSeconds.isAcceptableOrUnknown(
              data['session_time_in_seconds']!, _sessionTimeInSecondsMeta));
    } else if (isInserting) {
      context.missing(_sessionTimeInSecondsMeta);
    }
    if (data.containsKey('session_priority')) {
      context.handle(
          _sessionPriorityMeta,
          sessionPriority.isAcceptableOrUnknown(
              data['session_priority']!, _sessionPriorityMeta));
    } else if (isInserting) {
      context.missing(_sessionPriorityMeta);
    }
    if (data.containsKey('session_memo')) {
      context.handle(
          _sessionMemoMeta,
          sessionMemo.isAcceptableOrUnknown(
              data['session_memo']!, _sessionMemoMeta));
    } else if (isInserting) {
      context.missing(_sessionMemoMeta);
    }
    if (data.containsKey('program_uid')) {
      context.handle(
          _programUidMeta,
          programUid.isAcceptableOrUnknown(
              data['program_uid']!, _programUidMeta));
    } else if (isInserting) {
      context.missing(_programUidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SessionDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionDto(
      sessionUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_uid'])!,
      sessionTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_title'])!,
      progressedSessionTimeInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}progressed_session_time_in_seconds'])!,
      sessionTimeInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}session_time_in_seconds'])!,
      sessionPriority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_priority'])!,
      sessionMemo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_memo'])!,
      programUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}program_uid'])!,
    );
  }

  @override
  $SessionDtosTable createAlias(String alias) {
    return $SessionDtosTable(attachedDatabase, alias);
  }
}

class SessionDto extends DataClass implements Insertable<SessionDto> {
  final String sessionUid;
  final String sessionTitle;
  final int progressedSessionTimeInSeconds;
  final int sessionTimeInSeconds;
  final int sessionPriority;
  final String sessionMemo;
  final String programUid;
  const SessionDto(
      {required this.sessionUid,
      required this.sessionTitle,
      required this.progressedSessionTimeInSeconds,
      required this.sessionTimeInSeconds,
      required this.sessionPriority,
      required this.sessionMemo,
      required this.programUid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_uid'] = Variable<String>(sessionUid);
    map['session_title'] = Variable<String>(sessionTitle);
    map['progressed_session_time_in_seconds'] =
        Variable<int>(progressedSessionTimeInSeconds);
    map['session_time_in_seconds'] = Variable<int>(sessionTimeInSeconds);
    map['session_priority'] = Variable<int>(sessionPriority);
    map['session_memo'] = Variable<String>(sessionMemo);
    map['program_uid'] = Variable<String>(programUid);
    return map;
  }

  SessionDtosCompanion toCompanion(bool nullToAbsent) {
    return SessionDtosCompanion(
      sessionUid: Value(sessionUid),
      sessionTitle: Value(sessionTitle),
      progressedSessionTimeInSeconds: Value(progressedSessionTimeInSeconds),
      sessionTimeInSeconds: Value(sessionTimeInSeconds),
      sessionPriority: Value(sessionPriority),
      sessionMemo: Value(sessionMemo),
      programUid: Value(programUid),
    );
  }

  factory SessionDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionDto(
      sessionUid: serializer.fromJson<String>(json['sessionUid']),
      sessionTitle: serializer.fromJson<String>(json['sessionTitle']),
      progressedSessionTimeInSeconds:
          serializer.fromJson<int>(json['progressedSessionTimeInSeconds']),
      sessionTimeInSeconds:
          serializer.fromJson<int>(json['sessionTimeInSeconds']),
      sessionPriority: serializer.fromJson<int>(json['sessionPriority']),
      sessionMemo: serializer.fromJson<String>(json['sessionMemo']),
      programUid: serializer.fromJson<String>(json['programUid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionUid': serializer.toJson<String>(sessionUid),
      'sessionTitle': serializer.toJson<String>(sessionTitle),
      'progressedSessionTimeInSeconds':
          serializer.toJson<int>(progressedSessionTimeInSeconds),
      'sessionTimeInSeconds': serializer.toJson<int>(sessionTimeInSeconds),
      'sessionPriority': serializer.toJson<int>(sessionPriority),
      'sessionMemo': serializer.toJson<String>(sessionMemo),
      'programUid': serializer.toJson<String>(programUid),
    };
  }

  SessionDto copyWith(
          {String? sessionUid,
          String? sessionTitle,
          int? progressedSessionTimeInSeconds,
          int? sessionTimeInSeconds,
          int? sessionPriority,
          String? sessionMemo,
          String? programUid}) =>
      SessionDto(
        sessionUid: sessionUid ?? this.sessionUid,
        sessionTitle: sessionTitle ?? this.sessionTitle,
        progressedSessionTimeInSeconds: progressedSessionTimeInSeconds ??
            this.progressedSessionTimeInSeconds,
        sessionTimeInSeconds: sessionTimeInSeconds ?? this.sessionTimeInSeconds,
        sessionPriority: sessionPriority ?? this.sessionPriority,
        sessionMemo: sessionMemo ?? this.sessionMemo,
        programUid: programUid ?? this.programUid,
      );
  SessionDto copyWithCompanion(SessionDtosCompanion data) {
    return SessionDto(
      sessionUid:
          data.sessionUid.present ? data.sessionUid.value : this.sessionUid,
      sessionTitle: data.sessionTitle.present
          ? data.sessionTitle.value
          : this.sessionTitle,
      progressedSessionTimeInSeconds:
          data.progressedSessionTimeInSeconds.present
              ? data.progressedSessionTimeInSeconds.value
              : this.progressedSessionTimeInSeconds,
      sessionTimeInSeconds: data.sessionTimeInSeconds.present
          ? data.sessionTimeInSeconds.value
          : this.sessionTimeInSeconds,
      sessionPriority: data.sessionPriority.present
          ? data.sessionPriority.value
          : this.sessionPriority,
      sessionMemo:
          data.sessionMemo.present ? data.sessionMemo.value : this.sessionMemo,
      programUid:
          data.programUid.present ? data.programUid.value : this.programUid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionDto(')
          ..write('sessionUid: $sessionUid, ')
          ..write('sessionTitle: $sessionTitle, ')
          ..write(
              'progressedSessionTimeInSeconds: $progressedSessionTimeInSeconds, ')
          ..write('sessionTimeInSeconds: $sessionTimeInSeconds, ')
          ..write('sessionPriority: $sessionPriority, ')
          ..write('sessionMemo: $sessionMemo, ')
          ..write('programUid: $programUid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      sessionUid,
      sessionTitle,
      progressedSessionTimeInSeconds,
      sessionTimeInSeconds,
      sessionPriority,
      sessionMemo,
      programUid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionDto &&
          other.sessionUid == this.sessionUid &&
          other.sessionTitle == this.sessionTitle &&
          other.progressedSessionTimeInSeconds ==
              this.progressedSessionTimeInSeconds &&
          other.sessionTimeInSeconds == this.sessionTimeInSeconds &&
          other.sessionPriority == this.sessionPriority &&
          other.sessionMemo == this.sessionMemo &&
          other.programUid == this.programUid);
}

class SessionDtosCompanion extends UpdateCompanion<SessionDto> {
  final Value<String> sessionUid;
  final Value<String> sessionTitle;
  final Value<int> progressedSessionTimeInSeconds;
  final Value<int> sessionTimeInSeconds;
  final Value<int> sessionPriority;
  final Value<String> sessionMemo;
  final Value<String> programUid;
  final Value<int> rowid;
  const SessionDtosCompanion({
    this.sessionUid = const Value.absent(),
    this.sessionTitle = const Value.absent(),
    this.progressedSessionTimeInSeconds = const Value.absent(),
    this.sessionTimeInSeconds = const Value.absent(),
    this.sessionPriority = const Value.absent(),
    this.sessionMemo = const Value.absent(),
    this.programUid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionDtosCompanion.insert({
    required String sessionUid,
    required String sessionTitle,
    required int progressedSessionTimeInSeconds,
    required int sessionTimeInSeconds,
    required int sessionPriority,
    required String sessionMemo,
    required String programUid,
    this.rowid = const Value.absent(),
  })  : sessionUid = Value(sessionUid),
        sessionTitle = Value(sessionTitle),
        progressedSessionTimeInSeconds = Value(progressedSessionTimeInSeconds),
        sessionTimeInSeconds = Value(sessionTimeInSeconds),
        sessionPriority = Value(sessionPriority),
        sessionMemo = Value(sessionMemo),
        programUid = Value(programUid);
  static Insertable<SessionDto> custom({
    Expression<String>? sessionUid,
    Expression<String>? sessionTitle,
    Expression<int>? progressedSessionTimeInSeconds,
    Expression<int>? sessionTimeInSeconds,
    Expression<int>? sessionPriority,
    Expression<String>? sessionMemo,
    Expression<String>? programUid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionUid != null) 'session_uid': sessionUid,
      if (sessionTitle != null) 'session_title': sessionTitle,
      if (progressedSessionTimeInSeconds != null)
        'progressed_session_time_in_seconds': progressedSessionTimeInSeconds,
      if (sessionTimeInSeconds != null)
        'session_time_in_seconds': sessionTimeInSeconds,
      if (sessionPriority != null) 'session_priority': sessionPriority,
      if (sessionMemo != null) 'session_memo': sessionMemo,
      if (programUid != null) 'program_uid': programUid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionDtosCompanion copyWith(
      {Value<String>? sessionUid,
      Value<String>? sessionTitle,
      Value<int>? progressedSessionTimeInSeconds,
      Value<int>? sessionTimeInSeconds,
      Value<int>? sessionPriority,
      Value<String>? sessionMemo,
      Value<String>? programUid,
      Value<int>? rowid}) {
    return SessionDtosCompanion(
      sessionUid: sessionUid ?? this.sessionUid,
      sessionTitle: sessionTitle ?? this.sessionTitle,
      progressedSessionTimeInSeconds:
          progressedSessionTimeInSeconds ?? this.progressedSessionTimeInSeconds,
      sessionTimeInSeconds: sessionTimeInSeconds ?? this.sessionTimeInSeconds,
      sessionPriority: sessionPriority ?? this.sessionPriority,
      sessionMemo: sessionMemo ?? this.sessionMemo,
      programUid: programUid ?? this.programUid,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionUid.present) {
      map['session_uid'] = Variable<String>(sessionUid.value);
    }
    if (sessionTitle.present) {
      map['session_title'] = Variable<String>(sessionTitle.value);
    }
    if (progressedSessionTimeInSeconds.present) {
      map['progressed_session_time_in_seconds'] =
          Variable<int>(progressedSessionTimeInSeconds.value);
    }
    if (sessionTimeInSeconds.present) {
      map['session_time_in_seconds'] =
          Variable<int>(sessionTimeInSeconds.value);
    }
    if (sessionPriority.present) {
      map['session_priority'] = Variable<int>(sessionPriority.value);
    }
    if (sessionMemo.present) {
      map['session_memo'] = Variable<String>(sessionMemo.value);
    }
    if (programUid.present) {
      map['program_uid'] = Variable<String>(programUid.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionDtosCompanion(')
          ..write('sessionUid: $sessionUid, ')
          ..write('sessionTitle: $sessionTitle, ')
          ..write(
              'progressedSessionTimeInSeconds: $progressedSessionTimeInSeconds, ')
          ..write('sessionTimeInSeconds: $sessionTimeInSeconds, ')
          ..write('sessionPriority: $sessionPriority, ')
          ..write('sessionMemo: $sessionMemo, ')
          ..write('programUid: $programUid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramHistoryDtosTable extends ProgramHistoryDtos
    with TableInfo<$ProgramHistoryDtosTable, ProgramHistoryDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramHistoryDtosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _programHistoryUidMeta =
      const VerificationMeta('programHistoryUid');
  @override
  late final GeneratedColumn<String> programHistoryUid =
      GeneratedColumn<String>('program_history_uid', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _programUidMeta =
      const VerificationMeta('programUid');
  @override
  late final GeneratedColumn<String> programUid = GeneratedColumn<String>(
      'program_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endedAtMeta =
      const VerificationMeta('endedAt');
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
      'ended_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _totalProgressedTimeInSecondsMeta =
      const VerificationMeta('totalProgressedTimeInSeconds');
  @override
  late final GeneratedColumn<int> totalProgressedTimeInSeconds =
      GeneratedColumn<int>(
          'total_progressed_time_in_seconds', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        programHistoryUid,
        programUid,
        startedAt,
        endedAt,
        totalProgressedTimeInSeconds
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'program_history_dtos';
  @override
  VerificationContext validateIntegrity(Insertable<ProgramHistoryDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('program_history_uid')) {
      context.handle(
          _programHistoryUidMeta,
          programHistoryUid.isAcceptableOrUnknown(
              data['program_history_uid']!, _programHistoryUidMeta));
    } else if (isInserting) {
      context.missing(_programHistoryUidMeta);
    }
    if (data.containsKey('program_uid')) {
      context.handle(
          _programUidMeta,
          programUid.isAcceptableOrUnknown(
              data['program_uid']!, _programUidMeta));
    } else if (isInserting) {
      context.missing(_programUidMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(_endedAtMeta,
          endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta));
    }
    if (data.containsKey('total_progressed_time_in_seconds')) {
      context.handle(
          _totalProgressedTimeInSecondsMeta,
          totalProgressedTimeInSeconds.isAcceptableOrUnknown(
              data['total_progressed_time_in_seconds']!,
              _totalProgressedTimeInSecondsMeta));
    } else if (isInserting) {
      context.missing(_totalProgressedTimeInSecondsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProgramHistoryDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramHistoryDto(
      programHistoryUid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}program_history_uid'])!,
      programUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}program_uid'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      endedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ended_at']),
      totalProgressedTimeInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}total_progressed_time_in_seconds'])!,
    );
  }

  @override
  $ProgramHistoryDtosTable createAlias(String alias) {
    return $ProgramHistoryDtosTable(attachedDatabase, alias);
  }
}

class ProgramHistoryDto extends DataClass
    implements Insertable<ProgramHistoryDto> {
  final String programHistoryUid;
  final String programUid;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int totalProgressedTimeInSeconds;
  const ProgramHistoryDto(
      {required this.programHistoryUid,
      required this.programUid,
      required this.startedAt,
      this.endedAt,
      required this.totalProgressedTimeInSeconds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['program_history_uid'] = Variable<String>(programHistoryUid);
    map['program_uid'] = Variable<String>(programUid);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['total_progressed_time_in_seconds'] =
        Variable<int>(totalProgressedTimeInSeconds);
    return map;
  }

  ProgramHistoryDtosCompanion toCompanion(bool nullToAbsent) {
    return ProgramHistoryDtosCompanion(
      programHistoryUid: Value(programHistoryUid),
      programUid: Value(programUid),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      totalProgressedTimeInSeconds: Value(totalProgressedTimeInSeconds),
    );
  }

  factory ProgramHistoryDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramHistoryDto(
      programHistoryUid: serializer.fromJson<String>(json['programHistoryUid']),
      programUid: serializer.fromJson<String>(json['programUid']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      totalProgressedTimeInSeconds:
          serializer.fromJson<int>(json['totalProgressedTimeInSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'programHistoryUid': serializer.toJson<String>(programHistoryUid),
      'programUid': serializer.toJson<String>(programUid),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'totalProgressedTimeInSeconds':
          serializer.toJson<int>(totalProgressedTimeInSeconds),
    };
  }

  ProgramHistoryDto copyWith(
          {String? programHistoryUid,
          String? programUid,
          DateTime? startedAt,
          Value<DateTime?> endedAt = const Value.absent(),
          int? totalProgressedTimeInSeconds}) =>
      ProgramHistoryDto(
        programHistoryUid: programHistoryUid ?? this.programHistoryUid,
        programUid: programUid ?? this.programUid,
        startedAt: startedAt ?? this.startedAt,
        endedAt: endedAt.present ? endedAt.value : this.endedAt,
        totalProgressedTimeInSeconds:
            totalProgressedTimeInSeconds ?? this.totalProgressedTimeInSeconds,
      );
  ProgramHistoryDto copyWithCompanion(ProgramHistoryDtosCompanion data) {
    return ProgramHistoryDto(
      programHistoryUid: data.programHistoryUid.present
          ? data.programHistoryUid.value
          : this.programHistoryUid,
      programUid:
          data.programUid.present ? data.programUid.value : this.programUid,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      totalProgressedTimeInSeconds: data.totalProgressedTimeInSeconds.present
          ? data.totalProgressedTimeInSeconds.value
          : this.totalProgressedTimeInSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramHistoryDto(')
          ..write('programHistoryUid: $programHistoryUid, ')
          ..write('programUid: $programUid, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('totalProgressedTimeInSeconds: $totalProgressedTimeInSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(programHistoryUid, programUid, startedAt,
      endedAt, totalProgressedTimeInSeconds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramHistoryDto &&
          other.programHistoryUid == this.programHistoryUid &&
          other.programUid == this.programUid &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.totalProgressedTimeInSeconds ==
              this.totalProgressedTimeInSeconds);
}

class ProgramHistoryDtosCompanion extends UpdateCompanion<ProgramHistoryDto> {
  final Value<String> programHistoryUid;
  final Value<String> programUid;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int> totalProgressedTimeInSeconds;
  final Value<int> rowid;
  const ProgramHistoryDtosCompanion({
    this.programHistoryUid = const Value.absent(),
    this.programUid = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.totalProgressedTimeInSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramHistoryDtosCompanion.insert({
    required String programHistoryUid,
    required String programUid,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    required int totalProgressedTimeInSeconds,
    this.rowid = const Value.absent(),
  })  : programHistoryUid = Value(programHistoryUid),
        programUid = Value(programUid),
        startedAt = Value(startedAt),
        totalProgressedTimeInSeconds = Value(totalProgressedTimeInSeconds);
  static Insertable<ProgramHistoryDto> custom({
    Expression<String>? programHistoryUid,
    Expression<String>? programUid,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? totalProgressedTimeInSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (programHistoryUid != null) 'program_history_uid': programHistoryUid,
      if (programUid != null) 'program_uid': programUid,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (totalProgressedTimeInSeconds != null)
        'total_progressed_time_in_seconds': totalProgressedTimeInSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramHistoryDtosCompanion copyWith(
      {Value<String>? programHistoryUid,
      Value<String>? programUid,
      Value<DateTime>? startedAt,
      Value<DateTime?>? endedAt,
      Value<int>? totalProgressedTimeInSeconds,
      Value<int>? rowid}) {
    return ProgramHistoryDtosCompanion(
      programHistoryUid: programHistoryUid ?? this.programHistoryUid,
      programUid: programUid ?? this.programUid,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      totalProgressedTimeInSeconds:
          totalProgressedTimeInSeconds ?? this.totalProgressedTimeInSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (programHistoryUid.present) {
      map['program_history_uid'] = Variable<String>(programHistoryUid.value);
    }
    if (programUid.present) {
      map['program_uid'] = Variable<String>(programUid.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (totalProgressedTimeInSeconds.present) {
      map['total_progressed_time_in_seconds'] =
          Variable<int>(totalProgressedTimeInSeconds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramHistoryDtosCompanion(')
          ..write('programHistoryUid: $programHistoryUid, ')
          ..write('programUid: $programUid, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write(
              'totalProgressedTimeInSeconds: $totalProgressedTimeInSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionHistoryDtosTable extends SessionHistoryDtos
    with TableInfo<$SessionHistoryDtosTable, SessionHistoryDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionHistoryDtosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionHistoryUidMeta =
      const VerificationMeta('sessionHistoryUid');
  @override
  late final GeneratedColumn<String> sessionHistoryUid =
      GeneratedColumn<String>('session_history_uid', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _programHistoryUidMeta =
      const VerificationMeta('programHistoryUid');
  @override
  late final GeneratedColumn<String> programHistoryUid =
      GeneratedColumn<String>('program_history_uid', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionUidMeta =
      const VerificationMeta('sessionUid');
  @override
  late final GeneratedColumn<String> sessionUid = GeneratedColumn<String>(
      'session_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _progressedTimeInSecondsMeta =
      const VerificationMeta('progressedTimeInSeconds');
  @override
  late final GeneratedColumn<int> progressedTimeInSeconds =
      GeneratedColumn<int>('progressed_time_in_seconds', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sessionMemoMeta =
      const VerificationMeta('sessionMemo');
  @override
  late final GeneratedColumn<String> sessionMemo = GeneratedColumn<String>(
      'session_memo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        sessionHistoryUid,
        programHistoryUid,
        sessionUid,
        progressedTimeInSeconds,
        sessionMemo
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_history_dtos';
  @override
  VerificationContext validateIntegrity(Insertable<SessionHistoryDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_history_uid')) {
      context.handle(
          _sessionHistoryUidMeta,
          sessionHistoryUid.isAcceptableOrUnknown(
              data['session_history_uid']!, _sessionHistoryUidMeta));
    } else if (isInserting) {
      context.missing(_sessionHistoryUidMeta);
    }
    if (data.containsKey('program_history_uid')) {
      context.handle(
          _programHistoryUidMeta,
          programHistoryUid.isAcceptableOrUnknown(
              data['program_history_uid']!, _programHistoryUidMeta));
    } else if (isInserting) {
      context.missing(_programHistoryUidMeta);
    }
    if (data.containsKey('session_uid')) {
      context.handle(
          _sessionUidMeta,
          sessionUid.isAcceptableOrUnknown(
              data['session_uid']!, _sessionUidMeta));
    } else if (isInserting) {
      context.missing(_sessionUidMeta);
    }
    if (data.containsKey('progressed_time_in_seconds')) {
      context.handle(
          _progressedTimeInSecondsMeta,
          progressedTimeInSeconds.isAcceptableOrUnknown(
              data['progressed_time_in_seconds']!,
              _progressedTimeInSecondsMeta));
    } else if (isInserting) {
      context.missing(_progressedTimeInSecondsMeta);
    }
    if (data.containsKey('session_memo')) {
      context.handle(
          _sessionMemoMeta,
          sessionMemo.isAcceptableOrUnknown(
              data['session_memo']!, _sessionMemoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SessionHistoryDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionHistoryDto(
      sessionHistoryUid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}session_history_uid'])!,
      programHistoryUid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}program_history_uid'])!,
      sessionUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_uid'])!,
      progressedTimeInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}progressed_time_in_seconds'])!,
      sessionMemo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_memo']),
    );
  }

  @override
  $SessionHistoryDtosTable createAlias(String alias) {
    return $SessionHistoryDtosTable(attachedDatabase, alias);
  }
}

class SessionHistoryDto extends DataClass
    implements Insertable<SessionHistoryDto> {
  final String sessionHistoryUid;
  final String programHistoryUid;
  final String sessionUid;
  final int progressedTimeInSeconds;
  final String? sessionMemo;
  const SessionHistoryDto(
      {required this.sessionHistoryUid,
      required this.programHistoryUid,
      required this.sessionUid,
      required this.progressedTimeInSeconds,
      this.sessionMemo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_history_uid'] = Variable<String>(sessionHistoryUid);
    map['program_history_uid'] = Variable<String>(programHistoryUid);
    map['session_uid'] = Variable<String>(sessionUid);
    map['progressed_time_in_seconds'] = Variable<int>(progressedTimeInSeconds);
    if (!nullToAbsent || sessionMemo != null) {
      map['session_memo'] = Variable<String>(sessionMemo);
    }
    return map;
  }

  SessionHistoryDtosCompanion toCompanion(bool nullToAbsent) {
    return SessionHistoryDtosCompanion(
      sessionHistoryUid: Value(sessionHistoryUid),
      programHistoryUid: Value(programHistoryUid),
      sessionUid: Value(sessionUid),
      progressedTimeInSeconds: Value(progressedTimeInSeconds),
      sessionMemo: sessionMemo == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionMemo),
    );
  }

  factory SessionHistoryDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionHistoryDto(
      sessionHistoryUid: serializer.fromJson<String>(json['sessionHistoryUid']),
      programHistoryUid: serializer.fromJson<String>(json['programHistoryUid']),
      sessionUid: serializer.fromJson<String>(json['sessionUid']),
      progressedTimeInSeconds:
          serializer.fromJson<int>(json['progressedTimeInSeconds']),
      sessionMemo: serializer.fromJson<String?>(json['sessionMemo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionHistoryUid': serializer.toJson<String>(sessionHistoryUid),
      'programHistoryUid': serializer.toJson<String>(programHistoryUid),
      'sessionUid': serializer.toJson<String>(sessionUid),
      'progressedTimeInSeconds':
          serializer.toJson<int>(progressedTimeInSeconds),
      'sessionMemo': serializer.toJson<String?>(sessionMemo),
    };
  }

  SessionHistoryDto copyWith(
          {String? sessionHistoryUid,
          String? programHistoryUid,
          String? sessionUid,
          int? progressedTimeInSeconds,
          Value<String?> sessionMemo = const Value.absent()}) =>
      SessionHistoryDto(
        sessionHistoryUid: sessionHistoryUid ?? this.sessionHistoryUid,
        programHistoryUid: programHistoryUid ?? this.programHistoryUid,
        sessionUid: sessionUid ?? this.sessionUid,
        progressedTimeInSeconds:
            progressedTimeInSeconds ?? this.progressedTimeInSeconds,
        sessionMemo: sessionMemo.present ? sessionMemo.value : this.sessionMemo,
      );
  SessionHistoryDto copyWithCompanion(SessionHistoryDtosCompanion data) {
    return SessionHistoryDto(
      sessionHistoryUid: data.sessionHistoryUid.present
          ? data.sessionHistoryUid.value
          : this.sessionHistoryUid,
      programHistoryUid: data.programHistoryUid.present
          ? data.programHistoryUid.value
          : this.programHistoryUid,
      sessionUid:
          data.sessionUid.present ? data.sessionUid.value : this.sessionUid,
      progressedTimeInSeconds: data.progressedTimeInSeconds.present
          ? data.progressedTimeInSeconds.value
          : this.progressedTimeInSeconds,
      sessionMemo:
          data.sessionMemo.present ? data.sessionMemo.value : this.sessionMemo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionHistoryDto(')
          ..write('sessionHistoryUid: $sessionHistoryUid, ')
          ..write('programHistoryUid: $programHistoryUid, ')
          ..write('sessionUid: $sessionUid, ')
          ..write('progressedTimeInSeconds: $progressedTimeInSeconds, ')
          ..write('sessionMemo: $sessionMemo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sessionHistoryUid, programHistoryUid,
      sessionUid, progressedTimeInSeconds, sessionMemo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionHistoryDto &&
          other.sessionHistoryUid == this.sessionHistoryUid &&
          other.programHistoryUid == this.programHistoryUid &&
          other.sessionUid == this.sessionUid &&
          other.progressedTimeInSeconds == this.progressedTimeInSeconds &&
          other.sessionMemo == this.sessionMemo);
}

class SessionHistoryDtosCompanion extends UpdateCompanion<SessionHistoryDto> {
  final Value<String> sessionHistoryUid;
  final Value<String> programHistoryUid;
  final Value<String> sessionUid;
  final Value<int> progressedTimeInSeconds;
  final Value<String?> sessionMemo;
  final Value<int> rowid;
  const SessionHistoryDtosCompanion({
    this.sessionHistoryUid = const Value.absent(),
    this.programHistoryUid = const Value.absent(),
    this.sessionUid = const Value.absent(),
    this.progressedTimeInSeconds = const Value.absent(),
    this.sessionMemo = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionHistoryDtosCompanion.insert({
    required String sessionHistoryUid,
    required String programHistoryUid,
    required String sessionUid,
    required int progressedTimeInSeconds,
    this.sessionMemo = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : sessionHistoryUid = Value(sessionHistoryUid),
        programHistoryUid = Value(programHistoryUid),
        sessionUid = Value(sessionUid),
        progressedTimeInSeconds = Value(progressedTimeInSeconds);
  static Insertable<SessionHistoryDto> custom({
    Expression<String>? sessionHistoryUid,
    Expression<String>? programHistoryUid,
    Expression<String>? sessionUid,
    Expression<int>? progressedTimeInSeconds,
    Expression<String>? sessionMemo,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionHistoryUid != null) 'session_history_uid': sessionHistoryUid,
      if (programHistoryUid != null) 'program_history_uid': programHistoryUid,
      if (sessionUid != null) 'session_uid': sessionUid,
      if (progressedTimeInSeconds != null)
        'progressed_time_in_seconds': progressedTimeInSeconds,
      if (sessionMemo != null) 'session_memo': sessionMemo,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionHistoryDtosCompanion copyWith(
      {Value<String>? sessionHistoryUid,
      Value<String>? programHistoryUid,
      Value<String>? sessionUid,
      Value<int>? progressedTimeInSeconds,
      Value<String?>? sessionMemo,
      Value<int>? rowid}) {
    return SessionHistoryDtosCompanion(
      sessionHistoryUid: sessionHistoryUid ?? this.sessionHistoryUid,
      programHistoryUid: programHistoryUid ?? this.programHistoryUid,
      sessionUid: sessionUid ?? this.sessionUid,
      progressedTimeInSeconds:
          progressedTimeInSeconds ?? this.progressedTimeInSeconds,
      sessionMemo: sessionMemo ?? this.sessionMemo,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionHistoryUid.present) {
      map['session_history_uid'] = Variable<String>(sessionHistoryUid.value);
    }
    if (programHistoryUid.present) {
      map['program_history_uid'] = Variable<String>(programHistoryUid.value);
    }
    if (sessionUid.present) {
      map['session_uid'] = Variable<String>(sessionUid.value);
    }
    if (progressedTimeInSeconds.present) {
      map['progressed_time_in_seconds'] =
          Variable<int>(progressedTimeInSeconds.value);
    }
    if (sessionMemo.present) {
      map['session_memo'] = Variable<String>(sessionMemo.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionHistoryDtosCompanion(')
          ..write('sessionHistoryUid: $sessionHistoryUid, ')
          ..write('programHistoryUid: $programHistoryUid, ')
          ..write('sessionUid: $sessionUid, ')
          ..write('progressedTimeInSeconds: $progressedTimeInSeconds, ')
          ..write('sessionMemo: $sessionMemo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProgramDtosTable programDtos = $ProgramDtosTable(this);
  late final $SessionDtosTable sessionDtos = $SessionDtosTable(this);
  late final $ProgramHistoryDtosTable programHistoryDtos =
      $ProgramHistoryDtosTable(this);
  late final $SessionHistoryDtosTable sessionHistoryDtos =
      $SessionHistoryDtosTable(this);
  late final ProgramDao programDao = ProgramDao(this as AppDatabase);
  late final SessionDao sessionDao = SessionDao(this as AppDatabase);
  late final ProgramHistoryDao programHistoryDao =
      ProgramHistoryDao(this as AppDatabase);
  late final SessionHistoryDao sessionHistoryDao =
      SessionHistoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [programDtos, sessionDtos, programHistoryDtos, sessionHistoryDtos];
}

typedef $$ProgramDtosTableCreateCompanionBuilder = ProgramDtosCompanion
    Function({
  required String programTitle,
  required String programUid,
  required String programDescription,
  Value<DateTime?> startedAt,
  required int programTimeInSeconds,
  required int progressedProgramTimeInSeconds,
  Value<String?> programHistoryUid,
  Value<int> rowid,
});
typedef $$ProgramDtosTableUpdateCompanionBuilder = ProgramDtosCompanion
    Function({
  Value<String> programTitle,
  Value<String> programUid,
  Value<String> programDescription,
  Value<DateTime?> startedAt,
  Value<int> programTimeInSeconds,
  Value<int> progressedProgramTimeInSeconds,
  Value<String?> programHistoryUid,
  Value<int> rowid,
});

class $$ProgramDtosTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramDtosTable> {
  $$ProgramDtosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get programTitle => $composableBuilder(
      column: $table.programTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get programDescription => $composableBuilder(
      column: $table.programDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get programTimeInSeconds => $composableBuilder(
      column: $table.programTimeInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get progressedProgramTimeInSeconds => $composableBuilder(
      column: $table.progressedProgramTimeInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid,
      builder: (column) => ColumnFilters(column));
}

class $$ProgramDtosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramDtosTable> {
  $$ProgramDtosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get programTitle => $composableBuilder(
      column: $table.programTitle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get programDescription => $composableBuilder(
      column: $table.programDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get programTimeInSeconds => $composableBuilder(
      column: $table.programTimeInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get progressedProgramTimeInSeconds => $composableBuilder(
      column: $table.progressedProgramTimeInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid,
      builder: (column) => ColumnOrderings(column));
}

class $$ProgramDtosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramDtosTable> {
  $$ProgramDtosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get programTitle => $composableBuilder(
      column: $table.programTitle, builder: (column) => column);

  GeneratedColumn<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => column);

  GeneratedColumn<String> get programDescription => $composableBuilder(
      column: $table.programDescription, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get programTimeInSeconds => $composableBuilder(
      column: $table.programTimeInSeconds, builder: (column) => column);

  GeneratedColumn<int> get progressedProgramTimeInSeconds => $composableBuilder(
      column: $table.progressedProgramTimeInSeconds,
      builder: (column) => column);

  GeneratedColumn<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid, builder: (column) => column);
}

class $$ProgramDtosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProgramDtosTable,
    ProgramDto,
    $$ProgramDtosTableFilterComposer,
    $$ProgramDtosTableOrderingComposer,
    $$ProgramDtosTableAnnotationComposer,
    $$ProgramDtosTableCreateCompanionBuilder,
    $$ProgramDtosTableUpdateCompanionBuilder,
    (ProgramDto, BaseReferences<_$AppDatabase, $ProgramDtosTable, ProgramDto>),
    ProgramDto,
    PrefetchHooks Function()> {
  $$ProgramDtosTableTableManager(_$AppDatabase db, $ProgramDtosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramDtosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramDtosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgramDtosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> programTitle = const Value.absent(),
            Value<String> programUid = const Value.absent(),
            Value<String> programDescription = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<int> programTimeInSeconds = const Value.absent(),
            Value<int> progressedProgramTimeInSeconds = const Value.absent(),
            Value<String?> programHistoryUid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProgramDtosCompanion(
            programTitle: programTitle,
            programUid: programUid,
            programDescription: programDescription,
            startedAt: startedAt,
            programTimeInSeconds: programTimeInSeconds,
            progressedProgramTimeInSeconds: progressedProgramTimeInSeconds,
            programHistoryUid: programHistoryUid,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String programTitle,
            required String programUid,
            required String programDescription,
            Value<DateTime?> startedAt = const Value.absent(),
            required int programTimeInSeconds,
            required int progressedProgramTimeInSeconds,
            Value<String?> programHistoryUid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProgramDtosCompanion.insert(
            programTitle: programTitle,
            programUid: programUid,
            programDescription: programDescription,
            startedAt: startedAt,
            programTimeInSeconds: programTimeInSeconds,
            progressedProgramTimeInSeconds: progressedProgramTimeInSeconds,
            programHistoryUid: programHistoryUid,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProgramDtosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProgramDtosTable,
    ProgramDto,
    $$ProgramDtosTableFilterComposer,
    $$ProgramDtosTableOrderingComposer,
    $$ProgramDtosTableAnnotationComposer,
    $$ProgramDtosTableCreateCompanionBuilder,
    $$ProgramDtosTableUpdateCompanionBuilder,
    (ProgramDto, BaseReferences<_$AppDatabase, $ProgramDtosTable, ProgramDto>),
    ProgramDto,
    PrefetchHooks Function()>;
typedef $$SessionDtosTableCreateCompanionBuilder = SessionDtosCompanion
    Function({
  required String sessionUid,
  required String sessionTitle,
  required int progressedSessionTimeInSeconds,
  required int sessionTimeInSeconds,
  required int sessionPriority,
  required String sessionMemo,
  required String programUid,
  Value<int> rowid,
});
typedef $$SessionDtosTableUpdateCompanionBuilder = SessionDtosCompanion
    Function({
  Value<String> sessionUid,
  Value<String> sessionTitle,
  Value<int> progressedSessionTimeInSeconds,
  Value<int> sessionTimeInSeconds,
  Value<int> sessionPriority,
  Value<String> sessionMemo,
  Value<String> programUid,
  Value<int> rowid,
});

class $$SessionDtosTableFilterComposer
    extends Composer<_$AppDatabase, $SessionDtosTable> {
  $$SessionDtosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionUid => $composableBuilder(
      column: $table.sessionUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionTitle => $composableBuilder(
      column: $table.sessionTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get progressedSessionTimeInSeconds => $composableBuilder(
      column: $table.progressedSessionTimeInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionTimeInSeconds => $composableBuilder(
      column: $table.sessionTimeInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionPriority => $composableBuilder(
      column: $table.sessionPriority,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionMemo => $composableBuilder(
      column: $table.sessionMemo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => ColumnFilters(column));
}

class $$SessionDtosTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionDtosTable> {
  $$SessionDtosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionUid => $composableBuilder(
      column: $table.sessionUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionTitle => $composableBuilder(
      column: $table.sessionTitle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get progressedSessionTimeInSeconds => $composableBuilder(
      column: $table.progressedSessionTimeInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionTimeInSeconds => $composableBuilder(
      column: $table.sessionTimeInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionPriority => $composableBuilder(
      column: $table.sessionPriority,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionMemo => $composableBuilder(
      column: $table.sessionMemo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => ColumnOrderings(column));
}

class $$SessionDtosTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionDtosTable> {
  $$SessionDtosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionUid => $composableBuilder(
      column: $table.sessionUid, builder: (column) => column);

  GeneratedColumn<String> get sessionTitle => $composableBuilder(
      column: $table.sessionTitle, builder: (column) => column);

  GeneratedColumn<int> get progressedSessionTimeInSeconds => $composableBuilder(
      column: $table.progressedSessionTimeInSeconds,
      builder: (column) => column);

  GeneratedColumn<int> get sessionTimeInSeconds => $composableBuilder(
      column: $table.sessionTimeInSeconds, builder: (column) => column);

  GeneratedColumn<int> get sessionPriority => $composableBuilder(
      column: $table.sessionPriority, builder: (column) => column);

  GeneratedColumn<String> get sessionMemo => $composableBuilder(
      column: $table.sessionMemo, builder: (column) => column);

  GeneratedColumn<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => column);
}

class $$SessionDtosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SessionDtosTable,
    SessionDto,
    $$SessionDtosTableFilterComposer,
    $$SessionDtosTableOrderingComposer,
    $$SessionDtosTableAnnotationComposer,
    $$SessionDtosTableCreateCompanionBuilder,
    $$SessionDtosTableUpdateCompanionBuilder,
    (SessionDto, BaseReferences<_$AppDatabase, $SessionDtosTable, SessionDto>),
    SessionDto,
    PrefetchHooks Function()> {
  $$SessionDtosTableTableManager(_$AppDatabase db, $SessionDtosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionDtosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionDtosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionDtosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> sessionUid = const Value.absent(),
            Value<String> sessionTitle = const Value.absent(),
            Value<int> progressedSessionTimeInSeconds = const Value.absent(),
            Value<int> sessionTimeInSeconds = const Value.absent(),
            Value<int> sessionPriority = const Value.absent(),
            Value<String> sessionMemo = const Value.absent(),
            Value<String> programUid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionDtosCompanion(
            sessionUid: sessionUid,
            sessionTitle: sessionTitle,
            progressedSessionTimeInSeconds: progressedSessionTimeInSeconds,
            sessionTimeInSeconds: sessionTimeInSeconds,
            sessionPriority: sessionPriority,
            sessionMemo: sessionMemo,
            programUid: programUid,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String sessionUid,
            required String sessionTitle,
            required int progressedSessionTimeInSeconds,
            required int sessionTimeInSeconds,
            required int sessionPriority,
            required String sessionMemo,
            required String programUid,
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionDtosCompanion.insert(
            sessionUid: sessionUid,
            sessionTitle: sessionTitle,
            progressedSessionTimeInSeconds: progressedSessionTimeInSeconds,
            sessionTimeInSeconds: sessionTimeInSeconds,
            sessionPriority: sessionPriority,
            sessionMemo: sessionMemo,
            programUid: programUid,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SessionDtosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SessionDtosTable,
    SessionDto,
    $$SessionDtosTableFilterComposer,
    $$SessionDtosTableOrderingComposer,
    $$SessionDtosTableAnnotationComposer,
    $$SessionDtosTableCreateCompanionBuilder,
    $$SessionDtosTableUpdateCompanionBuilder,
    (SessionDto, BaseReferences<_$AppDatabase, $SessionDtosTable, SessionDto>),
    SessionDto,
    PrefetchHooks Function()>;
typedef $$ProgramHistoryDtosTableCreateCompanionBuilder
    = ProgramHistoryDtosCompanion Function({
  required String programHistoryUid,
  required String programUid,
  required DateTime startedAt,
  Value<DateTime?> endedAt,
  required int totalProgressedTimeInSeconds,
  Value<int> rowid,
});
typedef $$ProgramHistoryDtosTableUpdateCompanionBuilder
    = ProgramHistoryDtosCompanion Function({
  Value<String> programHistoryUid,
  Value<String> programUid,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<int> totalProgressedTimeInSeconds,
  Value<int> rowid,
});

class $$ProgramHistoryDtosTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramHistoryDtosTable> {
  $$ProgramHistoryDtosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalProgressedTimeInSeconds => $composableBuilder(
      column: $table.totalProgressedTimeInSeconds,
      builder: (column) => ColumnFilters(column));
}

class $$ProgramHistoryDtosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramHistoryDtosTable> {
  $$ProgramHistoryDtosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalProgressedTimeInSeconds => $composableBuilder(
      column: $table.totalProgressedTimeInSeconds,
      builder: (column) => ColumnOrderings(column));
}

class $$ProgramHistoryDtosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramHistoryDtosTable> {
  $$ProgramHistoryDtosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid, builder: (column) => column);

  GeneratedColumn<String> get programUid => $composableBuilder(
      column: $table.programUid, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get totalProgressedTimeInSeconds => $composableBuilder(
      column: $table.totalProgressedTimeInSeconds, builder: (column) => column);
}

class $$ProgramHistoryDtosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProgramHistoryDtosTable,
    ProgramHistoryDto,
    $$ProgramHistoryDtosTableFilterComposer,
    $$ProgramHistoryDtosTableOrderingComposer,
    $$ProgramHistoryDtosTableAnnotationComposer,
    $$ProgramHistoryDtosTableCreateCompanionBuilder,
    $$ProgramHistoryDtosTableUpdateCompanionBuilder,
    (
      ProgramHistoryDto,
      BaseReferences<_$AppDatabase, $ProgramHistoryDtosTable, ProgramHistoryDto>
    ),
    ProgramHistoryDto,
    PrefetchHooks Function()> {
  $$ProgramHistoryDtosTableTableManager(
      _$AppDatabase db, $ProgramHistoryDtosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramHistoryDtosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramHistoryDtosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgramHistoryDtosTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> programHistoryUid = const Value.absent(),
            Value<String> programUid = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endedAt = const Value.absent(),
            Value<int> totalProgressedTimeInSeconds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProgramHistoryDtosCompanion(
            programHistoryUid: programHistoryUid,
            programUid: programUid,
            startedAt: startedAt,
            endedAt: endedAt,
            totalProgressedTimeInSeconds: totalProgressedTimeInSeconds,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String programHistoryUid,
            required String programUid,
            required DateTime startedAt,
            Value<DateTime?> endedAt = const Value.absent(),
            required int totalProgressedTimeInSeconds,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProgramHistoryDtosCompanion.insert(
            programHistoryUid: programHistoryUid,
            programUid: programUid,
            startedAt: startedAt,
            endedAt: endedAt,
            totalProgressedTimeInSeconds: totalProgressedTimeInSeconds,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProgramHistoryDtosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProgramHistoryDtosTable,
    ProgramHistoryDto,
    $$ProgramHistoryDtosTableFilterComposer,
    $$ProgramHistoryDtosTableOrderingComposer,
    $$ProgramHistoryDtosTableAnnotationComposer,
    $$ProgramHistoryDtosTableCreateCompanionBuilder,
    $$ProgramHistoryDtosTableUpdateCompanionBuilder,
    (
      ProgramHistoryDto,
      BaseReferences<_$AppDatabase, $ProgramHistoryDtosTable, ProgramHistoryDto>
    ),
    ProgramHistoryDto,
    PrefetchHooks Function()>;
typedef $$SessionHistoryDtosTableCreateCompanionBuilder
    = SessionHistoryDtosCompanion Function({
  required String sessionHistoryUid,
  required String programHistoryUid,
  required String sessionUid,
  required int progressedTimeInSeconds,
  Value<String?> sessionMemo,
  Value<int> rowid,
});
typedef $$SessionHistoryDtosTableUpdateCompanionBuilder
    = SessionHistoryDtosCompanion Function({
  Value<String> sessionHistoryUid,
  Value<String> programHistoryUid,
  Value<String> sessionUid,
  Value<int> progressedTimeInSeconds,
  Value<String?> sessionMemo,
  Value<int> rowid,
});

class $$SessionHistoryDtosTableFilterComposer
    extends Composer<_$AppDatabase, $SessionHistoryDtosTable> {
  $$SessionHistoryDtosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionHistoryUid => $composableBuilder(
      column: $table.sessionHistoryUid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionUid => $composableBuilder(
      column: $table.sessionUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get progressedTimeInSeconds => $composableBuilder(
      column: $table.progressedTimeInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionMemo => $composableBuilder(
      column: $table.sessionMemo, builder: (column) => ColumnFilters(column));
}

class $$SessionHistoryDtosTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionHistoryDtosTable> {
  $$SessionHistoryDtosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionHistoryUid => $composableBuilder(
      column: $table.sessionHistoryUid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionUid => $composableBuilder(
      column: $table.sessionUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get progressedTimeInSeconds => $composableBuilder(
      column: $table.progressedTimeInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionMemo => $composableBuilder(
      column: $table.sessionMemo, builder: (column) => ColumnOrderings(column));
}

class $$SessionHistoryDtosTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionHistoryDtosTable> {
  $$SessionHistoryDtosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionHistoryUid => $composableBuilder(
      column: $table.sessionHistoryUid, builder: (column) => column);

  GeneratedColumn<String> get programHistoryUid => $composableBuilder(
      column: $table.programHistoryUid, builder: (column) => column);

  GeneratedColumn<String> get sessionUid => $composableBuilder(
      column: $table.sessionUid, builder: (column) => column);

  GeneratedColumn<int> get progressedTimeInSeconds => $composableBuilder(
      column: $table.progressedTimeInSeconds, builder: (column) => column);

  GeneratedColumn<String> get sessionMemo => $composableBuilder(
      column: $table.sessionMemo, builder: (column) => column);
}

class $$SessionHistoryDtosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SessionHistoryDtosTable,
    SessionHistoryDto,
    $$SessionHistoryDtosTableFilterComposer,
    $$SessionHistoryDtosTableOrderingComposer,
    $$SessionHistoryDtosTableAnnotationComposer,
    $$SessionHistoryDtosTableCreateCompanionBuilder,
    $$SessionHistoryDtosTableUpdateCompanionBuilder,
    (
      SessionHistoryDto,
      BaseReferences<_$AppDatabase, $SessionHistoryDtosTable, SessionHistoryDto>
    ),
    SessionHistoryDto,
    PrefetchHooks Function()> {
  $$SessionHistoryDtosTableTableManager(
      _$AppDatabase db, $SessionHistoryDtosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionHistoryDtosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionHistoryDtosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionHistoryDtosTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> sessionHistoryUid = const Value.absent(),
            Value<String> programHistoryUid = const Value.absent(),
            Value<String> sessionUid = const Value.absent(),
            Value<int> progressedTimeInSeconds = const Value.absent(),
            Value<String?> sessionMemo = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionHistoryDtosCompanion(
            sessionHistoryUid: sessionHistoryUid,
            programHistoryUid: programHistoryUid,
            sessionUid: sessionUid,
            progressedTimeInSeconds: progressedTimeInSeconds,
            sessionMemo: sessionMemo,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String sessionHistoryUid,
            required String programHistoryUid,
            required String sessionUid,
            required int progressedTimeInSeconds,
            Value<String?> sessionMemo = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionHistoryDtosCompanion.insert(
            sessionHistoryUid: sessionHistoryUid,
            programHistoryUid: programHistoryUid,
            sessionUid: sessionUid,
            progressedTimeInSeconds: progressedTimeInSeconds,
            sessionMemo: sessionMemo,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SessionHistoryDtosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SessionHistoryDtosTable,
    SessionHistoryDto,
    $$SessionHistoryDtosTableFilterComposer,
    $$SessionHistoryDtosTableOrderingComposer,
    $$SessionHistoryDtosTableAnnotationComposer,
    $$SessionHistoryDtosTableCreateCompanionBuilder,
    $$SessionHistoryDtosTableUpdateCompanionBuilder,
    (
      SessionHistoryDto,
      BaseReferences<_$AppDatabase, $SessionHistoryDtosTable, SessionHistoryDto>
    ),
    SessionHistoryDto,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProgramDtosTableTableManager get programDtos =>
      $$ProgramDtosTableTableManager(_db, _db.programDtos);
  $$SessionDtosTableTableManager get sessionDtos =>
      $$SessionDtosTableTableManager(_db, _db.sessionDtos);
  $$ProgramHistoryDtosTableTableManager get programHistoryDtos =>
      $$ProgramHistoryDtosTableTableManager(_db, _db.programHistoryDtos);
  $$SessionHistoryDtosTableTableManager get sessionHistoryDtos =>
      $$SessionHistoryDtosTableTableManager(_db, _db.sessionHistoryDtos);
}
