// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionHistory _$SessionHistoryFromJson(Map<String, dynamic> json) {
  return _SessionHistory.fromJson(json);
}

/// @nodoc
mixin _$SessionHistory {
  String get sessionHistoryUid => throw _privateConstructorUsedError;
  String get programHistoryUid => throw _privateConstructorUsedError;
  String get sessionUid => throw _privateConstructorUsedError;
  int get progressedTimeInSeconds => throw _privateConstructorUsedError;
  String? get sessionMemo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionHistoryCopyWith<SessionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionHistoryCopyWith<$Res> {
  factory $SessionHistoryCopyWith(
          SessionHistory value, $Res Function(SessionHistory) then) =
      _$SessionHistoryCopyWithImpl<$Res, SessionHistory>;
  @useResult
  $Res call(
      {String sessionHistoryUid,
      String programHistoryUid,
      String sessionUid,
      int progressedTimeInSeconds,
      String? sessionMemo});
}

/// @nodoc
class _$SessionHistoryCopyWithImpl<$Res, $Val extends SessionHistory>
    implements $SessionHistoryCopyWith<$Res> {
  _$SessionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionHistoryUid = null,
    Object? programHistoryUid = null,
    Object? sessionUid = null,
    Object? progressedTimeInSeconds = null,
    Object? sessionMemo = freezed,
  }) {
    return _then(_value.copyWith(
      sessionHistoryUid: null == sessionHistoryUid
          ? _value.sessionHistoryUid
          : sessionHistoryUid // ignore: cast_nullable_to_non_nullable
              as String,
      programHistoryUid: null == programHistoryUid
          ? _value.programHistoryUid
          : programHistoryUid // ignore: cast_nullable_to_non_nullable
              as String,
      sessionUid: null == sessionUid
          ? _value.sessionUid
          : sessionUid // ignore: cast_nullable_to_non_nullable
              as String,
      progressedTimeInSeconds: null == progressedTimeInSeconds
          ? _value.progressedTimeInSeconds
          : progressedTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionMemo: freezed == sessionMemo
          ? _value.sessionMemo
          : sessionMemo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionHistoryImplCopyWith<$Res>
    implements $SessionHistoryCopyWith<$Res> {
  factory _$$SessionHistoryImplCopyWith(_$SessionHistoryImpl value,
          $Res Function(_$SessionHistoryImpl) then) =
      __$$SessionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionHistoryUid,
      String programHistoryUid,
      String sessionUid,
      int progressedTimeInSeconds,
      String? sessionMemo});
}

/// @nodoc
class __$$SessionHistoryImplCopyWithImpl<$Res>
    extends _$SessionHistoryCopyWithImpl<$Res, _$SessionHistoryImpl>
    implements _$$SessionHistoryImplCopyWith<$Res> {
  __$$SessionHistoryImplCopyWithImpl(
      _$SessionHistoryImpl _value, $Res Function(_$SessionHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionHistoryUid = null,
    Object? programHistoryUid = null,
    Object? sessionUid = null,
    Object? progressedTimeInSeconds = null,
    Object? sessionMemo = freezed,
  }) {
    return _then(_$SessionHistoryImpl(
      sessionHistoryUid: null == sessionHistoryUid
          ? _value.sessionHistoryUid
          : sessionHistoryUid // ignore: cast_nullable_to_non_nullable
              as String,
      programHistoryUid: null == programHistoryUid
          ? _value.programHistoryUid
          : programHistoryUid // ignore: cast_nullable_to_non_nullable
              as String,
      sessionUid: null == sessionUid
          ? _value.sessionUid
          : sessionUid // ignore: cast_nullable_to_non_nullable
              as String,
      progressedTimeInSeconds: null == progressedTimeInSeconds
          ? _value.progressedTimeInSeconds
          : progressedTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionMemo: freezed == sessionMemo
          ? _value.sessionMemo
          : sessionMemo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionHistoryImpl implements _SessionHistory {
  const _$SessionHistoryImpl(
      {required this.sessionHistoryUid,
      required this.programHistoryUid,
      required this.sessionUid,
      required this.progressedTimeInSeconds,
      this.sessionMemo = ''});

  factory _$SessionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionHistoryImplFromJson(json);

  @override
  final String sessionHistoryUid;
  @override
  final String programHistoryUid;
  @override
  final String sessionUid;
  @override
  final int progressedTimeInSeconds;
  @override
  @JsonKey()
  final String? sessionMemo;

  @override
  String toString() {
    return 'SessionHistory(sessionHistoryUid: $sessionHistoryUid, programHistoryUid: $programHistoryUid, sessionUid: $sessionUid, progressedTimeInSeconds: $progressedTimeInSeconds, sessionMemo: $sessionMemo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionHistoryImpl &&
            (identical(other.sessionHistoryUid, sessionHistoryUid) ||
                other.sessionHistoryUid == sessionHistoryUid) &&
            (identical(other.programHistoryUid, programHistoryUid) ||
                other.programHistoryUid == programHistoryUid) &&
            (identical(other.sessionUid, sessionUid) ||
                other.sessionUid == sessionUid) &&
            (identical(
                    other.progressedTimeInSeconds, progressedTimeInSeconds) ||
                other.progressedTimeInSeconds == progressedTimeInSeconds) &&
            (identical(other.sessionMemo, sessionMemo) ||
                other.sessionMemo == sessionMemo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionHistoryUid,
      programHistoryUid, sessionUid, progressedTimeInSeconds, sessionMemo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionHistoryImplCopyWith<_$SessionHistoryImpl> get copyWith =>
      __$$SessionHistoryImplCopyWithImpl<_$SessionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionHistoryImplToJson(
      this,
    );
  }
}

abstract class _SessionHistory implements SessionHistory {
  const factory _SessionHistory(
      {required final String sessionHistoryUid,
      required final String programHistoryUid,
      required final String sessionUid,
      required final int progressedTimeInSeconds,
      final String? sessionMemo}) = _$SessionHistoryImpl;

  factory _SessionHistory.fromJson(Map<String, dynamic> json) =
      _$SessionHistoryImpl.fromJson;

  @override
  String get sessionHistoryUid;
  @override
  String get programHistoryUid;
  @override
  String get sessionUid;
  @override
  int get progressedTimeInSeconds;
  @override
  String? get sessionMemo;
  @override
  @JsonKey(ignore: true)
  _$$SessionHistoryImplCopyWith<_$SessionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
