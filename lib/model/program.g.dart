// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgramImpl _$$ProgramImplFromJson(Map<String, dynamic> json) =>
    _$ProgramImpl(
      programTitle: json['programTitle'] as String,
      programUid: json['programUid'] as String,
      programDescription: json['programDescription'] as String,
      startedHour: (json['startedHour'] as num).toInt(),
      startedMinute: (json['startedMinute'] as num).toInt(),
      programTimeInSeconds: (json['programTimeInSeconds'] as num).toInt(),
      programSessions: (json['programSessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProgramImplToJson(_$ProgramImpl instance) =>
    <String, dynamic>{
      'programTitle': instance.programTitle,
      'programUid': instance.programUid,
      'programDescription': instance.programDescription,
      'startedHour': instance.startedHour,
      'startedMinute': instance.startedMinute,
      'programTimeInSeconds': instance.programTimeInSeconds,
      'programSessions': instance.programSessions,
    };
