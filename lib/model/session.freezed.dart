// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String get sessionTitle => throw _privateConstructorUsedError;
  String get sessionUid => throw _privateConstructorUsedError;
  int get progressedSessionTimeInSeconds => throw _privateConstructorUsedError;
  int get sessionRemainingTime => throw _privateConstructorUsedError;
  int get sessionPriority => throw _privateConstructorUsedError;
  String get sessionMemo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String sessionTitle,
      String sessionUid,
      int progressedSessionTimeInSeconds,
      int sessionRemainingTime,
      int sessionPriority,
      String sessionMemo});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionTitle = null,
    Object? sessionUid = null,
    Object? progressedSessionTimeInSeconds = null,
    Object? sessionRemainingTime = null,
    Object? sessionPriority = null,
    Object? sessionMemo = null,
  }) {
    return _then(_value.copyWith(
      sessionTitle: null == sessionTitle
          ? _value.sessionTitle
          : sessionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      sessionUid: null == sessionUid
          ? _value.sessionUid
          : sessionUid // ignore: cast_nullable_to_non_nullable
              as String,
      progressedSessionTimeInSeconds: null == progressedSessionTimeInSeconds
          ? _value.progressedSessionTimeInSeconds
          : progressedSessionTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionRemainingTime: null == sessionRemainingTime
          ? _value.sessionRemainingTime
          : sessionRemainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      sessionPriority: null == sessionPriority
          ? _value.sessionPriority
          : sessionPriority // ignore: cast_nullable_to_non_nullable
              as int,
      sessionMemo: null == sessionMemo
          ? _value.sessionMemo
          : sessionMemo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionTitle,
      String sessionUid,
      int progressedSessionTimeInSeconds,
      int sessionRemainingTime,
      int sessionPriority,
      String sessionMemo});
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionTitle = null,
    Object? sessionUid = null,
    Object? progressedSessionTimeInSeconds = null,
    Object? sessionRemainingTime = null,
    Object? sessionPriority = null,
    Object? sessionMemo = null,
  }) {
    return _then(_$SessionImpl(
      sessionTitle: null == sessionTitle
          ? _value.sessionTitle
          : sessionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      sessionUid: null == sessionUid
          ? _value.sessionUid
          : sessionUid // ignore: cast_nullable_to_non_nullable
              as String,
      progressedSessionTimeInSeconds: null == progressedSessionTimeInSeconds
          ? _value.progressedSessionTimeInSeconds
          : progressedSessionTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionRemainingTime: null == sessionRemainingTime
          ? _value.sessionRemainingTime
          : sessionRemainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      sessionPriority: null == sessionPriority
          ? _value.sessionPriority
          : sessionPriority // ignore: cast_nullable_to_non_nullable
              as int,
      sessionMemo: null == sessionMemo
          ? _value.sessionMemo
          : sessionMemo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {required this.sessionTitle,
      required this.sessionUid,
      required this.progressedSessionTimeInSeconds,
      required this.sessionRemainingTime,
      required this.sessionPriority,
      required this.sessionMemo});

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final String sessionTitle;
  @override
  final String sessionUid;
  @override
  final int progressedSessionTimeInSeconds;
  @override
  final int sessionRemainingTime;
  @override
  final int sessionPriority;
  @override
  final String sessionMemo;

  @override
  String toString() {
    return 'Session(sessionTitle: $sessionTitle, sessionUid: $sessionUid, progressedSessionTimeInSeconds: $progressedSessionTimeInSeconds, sessionRemainingTime: $sessionRemainingTime, sessionPriority: $sessionPriority, sessionMemo: $sessionMemo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.sessionTitle, sessionTitle) ||
                other.sessionTitle == sessionTitle) &&
            (identical(other.sessionUid, sessionUid) ||
                other.sessionUid == sessionUid) &&
            (identical(other.progressedSessionTimeInSeconds,
                    progressedSessionTimeInSeconds) ||
                other.progressedSessionTimeInSeconds ==
                    progressedSessionTimeInSeconds) &&
            (identical(other.sessionRemainingTime, sessionRemainingTime) ||
                other.sessionRemainingTime == sessionRemainingTime) &&
            (identical(other.sessionPriority, sessionPriority) ||
                other.sessionPriority == sessionPriority) &&
            (identical(other.sessionMemo, sessionMemo) ||
                other.sessionMemo == sessionMemo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionTitle,
      sessionUid,
      progressedSessionTimeInSeconds,
      sessionRemainingTime,
      sessionPriority,
      sessionMemo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  const factory _Session(
      {required final String sessionTitle,
      required final String sessionUid,
      required final int progressedSessionTimeInSeconds,
      required final int sessionRemainingTime,
      required final int sessionPriority,
      required final String sessionMemo}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  String get sessionTitle;
  @override
  String get sessionUid;
  @override
  int get progressedSessionTimeInSeconds;
  @override
  int get sessionRemainingTime;
  @override
  int get sessionPriority;
  @override
  String get sessionMemo;
  @override
  @JsonKey(ignore: true)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
