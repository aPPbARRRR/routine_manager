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
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      programTimeInSeconds: (json['programTimeInSeconds'] as num).toInt(),
      progressedProgramTimeInSeconds:
          (json['progressedProgramTimeInSeconds'] as num).toInt(),
      programSessions: (json['programSessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      programHistoryUid: json['programHistoryUid'] as String? ?? null,
    );

Map<String, dynamic> _$$ProgramImplToJson(_$ProgramImpl instance) =>
    <String, dynamic>{
      'programTitle': instance.programTitle,
      'programUid': instance.programUid,
      'programDescription': instance.programDescription,
      'startedAt': instance.startedAt?.toIso8601String(),
      'programTimeInSeconds': instance.programTimeInSeconds,
      'progressedProgramTimeInSeconds': instance.progressedProgramTimeInSeconds,
      'programSessions': instance.programSessions,
      'programHistoryUid': instance.programHistoryUid,
    };
