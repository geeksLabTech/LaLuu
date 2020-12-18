// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appliance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplianceModel _$ApplianceModelFromJson(Map<String, dynamic> json) {
  return ApplianceModel(
    name: json['name'] as String,
    consumption: (double.parse(json['consumption']))?.toDouble(),
    standbyConsumption: (json['standbyConsumption'] as num)?.toDouble(),
    category: json['category'] as String,
  );
}

Map<String, dynamic> _$ApplianceModelToJson(ApplianceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'consumption': instance.consumption,
      'standbyConsumption': instance.standbyConsumption,
      'category': instance.category,
    };
