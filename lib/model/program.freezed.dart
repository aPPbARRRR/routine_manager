// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Program _$ProgramFromJson(Map<String, dynamic> json) {
  return _Program.fromJson(json);
}

/// @nodoc
mixin _$Program {
  String get programTitle => throw _privateConstructorUsedError;
  String get programUid => throw _privateConstructorUsedError;
  String get programDescription => throw _privateConstructorUsedError;
  int get startedHour => throw _privateConstructorUsedError;
  int get startedMinute => throw _privateConstructorUsedError;
  int get programTimeInSeconds => throw _privateConstructorUsedError;
  List<Session> get programSessions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramCopyWith<Program> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramCopyWith<$Res> {
  factory $ProgramCopyWith(Program value, $Res Function(Program) then) =
      _$ProgramCopyWithImpl<$Res, Program>;
  @useResult
  $Res call(
      {String programTitle,
      String programUid,
      String programDescription,
      int startedHour,
      int startedMinute,
      int programTimeInSeconds,
      List<Session> programSessions});
}

/// @nodoc
class _$ProgramCopyWithImpl<$Res, $Val extends Program>
    implements $ProgramCopyWith<$Res> {
  _$ProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programTitle = null,
    Object? programUid = null,
    Object? programDescription = null,
    Object? startedHour = null,
    Object? startedMinute = null,
    Object? programTimeInSeconds = null,
    Object? programSessions = null,
  }) {
    return _then(_value.copyWith(
      programTitle: null == programTitle
          ? _value.programTitle
          : programTitle // ignore: cast_nullable_to_non_nullable
              as String,
      programUid: null == programUid
          ? _value.programUid
          : programUid // ignore: cast_nullable_to_non_nullable
              as String,
      programDescription: null == programDescription
          ? _value.programDescription
          : programDescription // ignore: cast_nullable_to_non_nullable
              as String,
      startedHour: null == startedHour
          ? _value.startedHour
          : startedHour // ignore: cast_nullable_to_non_nullable
              as int,
      startedMinute: null == startedMinute
          ? _value.startedMinute
          : startedMinute // ignore: cast_nullable_to_non_nullable
              as int,
      programTimeInSeconds: null == programTimeInSeconds
          ? _value.programTimeInSeconds
          : programTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      programSessions: null == programSessions
          ? _value.programSessions
          : programSessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramImplCopyWith<$Res> implements $ProgramCopyWith<$Res> {
  factory _$$ProgramImplCopyWith(
          _$ProgramImpl value, $Res Function(_$ProgramImpl) then) =
      __$$ProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String programTitle,
      String programUid,
      String programDescription,
      int startedHour,
      int startedMinute,
      int programTimeInSeconds,
      List<Session> programSessions});
}

/// @nodoc
class __$$ProgramImplCopyWithImpl<$Res>
    extends _$ProgramCopyWithImpl<$Res, _$ProgramImpl>
    implements _$$ProgramImplCopyWith<$Res> {
  __$$ProgramImplCopyWithImpl(
      _$ProgramImpl _value, $Res Function(_$ProgramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programTitle = null,
    Object? programUid = null,
    Object? programDescription = null,
    Object? startedHour = null,
    Object? startedMinute = null,
    Object? programTimeInSeconds = null,
    Object? programSessions = null,
  }) {
    return _then(_$ProgramImpl(
      programTitle: null == programTitle
          ? _value.programTitle
          : programTitle // ignore: cast_nullable_to_non_nullable
              as String,
      programUid: null == programUid
          ? _value.programUid
          : programUid // ignore: cast_nullable_to_non_nullable
              as String,
      programDescription: null == programDescription
          ? _value.programDescription
          : programDescription // ignore: cast_nullable_to_non_nullable
              as String,
      startedHour: null == startedHour
          ? _value.startedHour
          : startedHour // ignore: cast_nullable_to_non_nullable
              as int,
      startedMinute: null == startedMinute
          ? _value.startedMinute
          : startedMinute // ignore: cast_nullable_to_non_nullable
              as int,
      programTimeInSeconds: null == programTimeInSeconds
          ? _value.programTimeInSeconds
          : programTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      programSessions: null == programSessions
          ? _value._programSessions
          : programSessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramImpl implements _Program {
  const _$ProgramImpl(
      {required this.programTitle,
      required this.programUid,
      required this.programDescription,
      required this.startedHour,
      required this.startedMinute,
      required this.programTimeInSeconds,
      required final List<Session> programSessions})
      : _programSessions = programSessions;

  factory _$ProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramImplFromJson(json);

  @override
  final String programTitle;
  @override
  final String programUid;
  @override
  final String programDescription;
  @override
  final int startedHour;
  @override
  final int startedMinute;
  @override
  final int programTimeInSeconds;
  final List<Session> _programSessions;
  @override
  List<Session> get programSessions {
    if (_programSessions is EqualUnmodifiableListView) return _programSessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programSessions);
  }

  @override
  String toString() {
    return 'Program(programTitle: $programTitle, programUid: $programUid, programDescription: $programDescription, startedHour: $startedHour, startedMinute: $startedMinute, programTimeInSeconds: $programTimeInSeconds, programSessions: $programSessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramImpl &&
            (identical(other.programTitle, programTitle) ||
                other.programTitle == programTitle) &&
            (identical(other.programUid, programUid) ||
                other.programUid == programUid) &&
            (identical(other.programDescription, programDescription) ||
                other.programDescription == programDescription) &&
            (identical(other.startedHour, startedHour) ||
                other.startedHour == startedHour) &&
            (identical(other.startedMinute, startedMinute) ||
                other.startedMinute == startedMinute) &&
            (identical(other.programTimeInSeconds, programTimeInSeconds) ||
                other.programTimeInSeconds == programTimeInSeconds) &&
            const DeepCollectionEquality()
                .equals(other._programSessions, _programSessions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      programTitle,
      programUid,
      programDescription,
      startedHour,
      startedMinute,
      programTimeInSeconds,
      const DeepCollectionEquality().hash(_programSessions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramImplCopyWith<_$ProgramImpl> get copyWith =>
      __$$ProgramImplCopyWithImpl<_$ProgramImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramImplToJson(
      this,
    );
  }
}

abstract class _Program implements Program {
  const factory _Program(
      {required final String programTitle,
      required final String programUid,
      required final String programDescription,
      required final int startedHour,
      required final int startedMinute,
      required final int programTimeInSeconds,
      required final List<Session> programSessions}) = _$ProgramImpl;

  factory _Program.fromJson(Map<String, dynamic> json) = _$ProgramImpl.fromJson;

  @override
  String get programTitle;
  @override
  String get programUid;
  @override
  String get programDescription;
  @override
  int get startedHour;
  @override
  int get startedMinute;
  @override
  int get programTimeInSeconds;
  @override
  List<Session> get programSessions;
  @override
  @JsonKey(ignore: true)
  _$$ProgramImplCopyWith<_$ProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
