// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgramHistoryImpl _$$ProgramHistoryImplFromJson(Map<String, dynamic> json) =>
    _$ProgramHistoryImpl(
      historyUid: json['historyUid'] as String,
      programUid: json['programUid'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      totalProgressedTimeInSeconds:
          (json['totalProgressedTimeInSeconds'] as num).toInt(),
    );

Map<String, dynamic> _$$ProgramHistoryImplToJson(
        _$ProgramHistoryImpl instance) =>
    <String, dynamic>{
      'historyUid': instance.historyUid,
      'programUid': instance.programUid,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
      'totalProgressedTimeInSeconds': instance.totalProgressedTimeInSeconds,
    };
