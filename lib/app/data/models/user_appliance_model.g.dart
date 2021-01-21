// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_appliance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApplianceModel _$UserApplianceModelFromJson(Map<String, dynamic> json) {
  return UserApplianceModel(
    applianceModel: json['applianceModel'] == null
        ? null
        : ApplianceModel.fromJson(
            Map<String, dynamic>.from(json['applianceModel'])),
    usage: (Map<String, dynamic>.from(json['usage']))?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
    tag: json['tag'] as String,
    consumptionOn: (json['consumptionOn'] as num)?.toDouble(),
    consumptionStandby: (json['consumptionStandby'] as num)?.toDouble(),
    consumptionTotal: (json['consumptionTotal'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$UserApplianceModelToJson(UserApplianceModel instance) =>
    <String, dynamic>{
      'applianceModel': instance.applianceModel?.toJson(),
      'usage': instance.usage,
      'tag': instance.tag,
      'consumptionOn': instance.consumptionOn,
      'consumptionStandby': instance.consumptionStandby,
      'consumptionTotal': instance.consumptionTotal,
    };
