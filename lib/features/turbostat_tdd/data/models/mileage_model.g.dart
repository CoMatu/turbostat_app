// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mileage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MileageModel _$MileageModelFromJson(Map<String, dynamic> json) => MileageModel(
      mileageDateTime: DateTime.parse(json['mileageDateTime'] as String),
      mileage: json['mileage'] as int,
    );

Map<String, dynamic> _$MileageModelToJson(MileageModel instance) =>
    <String, dynamic>{
      'mileageDateTime': instance.mileageDateTime.toIso8601String(),
      'mileage': instance.mileage,
    };
