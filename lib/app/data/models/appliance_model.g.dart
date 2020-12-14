// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appliance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplianceModel _$ApplianceModelFromJson(Map<String, dynamic> json) {
  return ApplianceModel(
    name: json['name'] as String,
    consumption: (json['consumption'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ApplianceModelToJson(ApplianceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'consumption': instance.consumption,
    };
