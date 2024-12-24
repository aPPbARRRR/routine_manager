// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionHistoryImpl _$$SessionHistoryImplFromJson(Map<String, dynamic> json) =>
    _$SessionHistoryImpl(
      sessionHistoryUid: json['sessionHistoryUid'] as String,
      programHistoryUid: json['programHistoryUid'] as String,
      sessionUid: json['sessionUid'] as String,
      progressedTimeInSeconds: (json['progressedTimeInSeconds'] as num).toInt(),
      sessionMemo: json['sessionMemo'] as String? ?? '',
    );

Map<String, dynamic> _$$SessionHistoryImplToJson(
        _$SessionHistoryImpl instance) =>
    <String, dynamic>{
      'sessionHistoryUid': instance.sessionHistoryUid,
      'programHistoryUid': instance.programHistoryUid,
      'sessionUid': instance.sessionUid,
      'progressedTimeInSeconds': instance.progressedTimeInSeconds,
      'sessionMemo': instance.sessionMemo,
    };
