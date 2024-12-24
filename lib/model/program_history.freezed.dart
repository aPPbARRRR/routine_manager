// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgramHistory _$ProgramHistoryFromJson(Map<String, dynamic> json) {
  return _ProgramHistory.fromJson(json);
}

/// @nodoc
mixin _$ProgramHistory {
  String get historyUid => throw _privateConstructorUsedError;
  String get programUid => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  int get totalProgressedTimeInSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramHistoryCopyWith<ProgramHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramHistoryCopyWith<$Res> {
  factory $ProgramHistoryCopyWith(
          ProgramHistory value, $Res Function(ProgramHistory) then) =
      _$ProgramHistoryCopyWithImpl<$Res, ProgramHistory>;
  @useResult
  $Res call(
      {String historyUid,
      String programUid,
      DateTime startedAt,
      DateTime? endedAt,
      int totalProgressedTimeInSeconds});
}

/// @nodoc
class _$ProgramHistoryCopyWithImpl<$Res, $Val extends ProgramHistory>
    implements $ProgramHistoryCopyWith<$Res> {
  _$ProgramHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyUid = null,
    Object? programUid = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? totalProgressedTimeInSeconds = null,
  }) {
    return _then(_value.copyWith(
      historyUid: null == historyUid
          ? _value.historyUid
          : historyUid // ignore: cast_nullable_to_non_nullable
              as String,
      programUid: null == programUid
          ? _value.programUid
          : programUid // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalProgressedTimeInSeconds: null == totalProgressedTimeInSeconds
          ? _value.totalProgressedTimeInSeconds
          : totalProgressedTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramHistoryImplCopyWith<$Res>
    implements $ProgramHistoryCopyWith<$Res> {
  factory _$$ProgramHistoryImplCopyWith(_$ProgramHistoryImpl value,
          $Res Function(_$ProgramHistoryImpl) then) =
      __$$ProgramHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String historyUid,
      String programUid,
      DateTime startedAt,
      DateTime? endedAt,
      int totalProgressedTimeInSeconds});
}

/// @nodoc
class __$$ProgramHistoryImplCopyWithImpl<$Res>
    extends _$ProgramHistoryCopyWithImpl<$Res, _$ProgramHistoryImpl>
    implements _$$ProgramHistoryImplCopyWith<$Res> {
  __$$ProgramHistoryImplCopyWithImpl(
      _$ProgramHistoryImpl _value, $Res Function(_$ProgramHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyUid = null,
    Object? programUid = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? totalProgressedTimeInSeconds = null,
  }) {
    return _then(_$ProgramHistoryImpl(
      historyUid: null == historyUid
          ? _value.historyUid
          : historyUid // ignore: cast_nullable_to_non_nullable
              as String,
      programUid: null == programUid
          ? _value.programUid
          : programUid // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalProgressedTimeInSeconds: null == totalProgressedTimeInSeconds
          ? _value.totalProgressedTimeInSeconds
          : totalProgressedTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramHistoryImpl implements _ProgramHistory {
  const _$ProgramHistoryImpl(
      {required this.historyUid,
      required this.programUid,
      required this.startedAt,
      required this.endedAt,
      required this.totalProgressedTimeInSeconds});

  factory _$ProgramHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramHistoryImplFromJson(json);

  @override
  final String historyUid;
  @override
  final String programUid;
  @override
  final DateTime startedAt;
  @override
  final DateTime? endedAt;
  @override
  final int totalProgressedTimeInSeconds;

  @override
  String toString() {
    return 'ProgramHistory(historyUid: $historyUid, programUid: $programUid, startedAt: $startedAt, endedAt: $endedAt, totalProgressedTimeInSeconds: $totalProgressedTimeInSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramHistoryImpl &&
            (identical(other.historyUid, historyUid) ||
                other.historyUid == historyUid) &&
            (identical(other.programUid, programUid) ||
                other.programUid == programUid) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.totalProgressedTimeInSeconds,
                    totalProgressedTimeInSeconds) ||
                other.totalProgressedTimeInSeconds ==
                    totalProgressedTimeInSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, historyUid, programUid,
      startedAt, endedAt, totalProgressedTimeInSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramHistoryImplCopyWith<_$ProgramHistoryImpl> get copyWith =>
      __$$ProgramHistoryImplCopyWithImpl<_$ProgramHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramHistoryImplToJson(
      this,
    );
  }
}

abstract class _ProgramHistory implements ProgramHistory {
  const factory _ProgramHistory(
      {required final String historyUid,
      required final String programUid,
      required final DateTime startedAt,
      required final DateTime? endedAt,
      required final int totalProgressedTimeInSeconds}) = _$ProgramHistoryImpl;

  factory _ProgramHistory.fromJson(Map<String, dynamic> json) =
      _$ProgramHistoryImpl.fromJson;

  @override
  String get historyUid;
  @override
  String get programUid;
  @override
  DateTime get startedAt;
  @override
  DateTime? get endedAt;
  @override
  int get totalProgressedTimeInSeconds;
  @override
  @JsonKey(ignore: true)
  _$$ProgramHistoryImplCopyWith<_$ProgramHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
