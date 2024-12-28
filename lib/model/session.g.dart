// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      sessionTitle: json['sessionTitle'] as String,
      programUid: json['programUid'] as String,
      sessionUid: json['sessionUid'] as String,
      progressedSessionTimeInSeconds:
          (json['progressedSessionTimeInSeconds'] as num).toInt(),
      sessionTimeInSeconds: (json['sessionTimeInSeconds'] as num).toInt(),
      sessionPriority: (json['sessionPriority'] as num).toInt(),
      sessionMemo: json['sessionMemo'] as String,
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'sessionTitle': instance.sessionTitle,
      'programUid': instance.programUid,
      'sessionUid': instance.sessionUid,
      'progressedSessionTimeInSeconds': instance.progressedSessionTimeInSeconds,
      'sessionTimeInSeconds': instance.sessionTimeInSeconds,
      'sessionPriority': instance.sessionPriority,
      'sessionMemo': instance.sessionMemo,
    };
