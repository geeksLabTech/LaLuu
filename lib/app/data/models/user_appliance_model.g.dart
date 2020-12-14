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
            json['applianceModel'] as Map<String, dynamic>),
    usage: (json['usage'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
  );
}

Map<String, dynamic> _$UserApplianceModelToJson(UserApplianceModel instance) =>
    <String, dynamic>{
      'applianceModel': instance.applianceModel?.toJson(),
      'usage': instance.usage,
    };
