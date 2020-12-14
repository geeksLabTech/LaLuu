import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_appliance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserApplianceModel {
  ApplianceModel applianceModel;
  Map<String, double> usage;

  UserApplianceModel({this.applianceModel, this.usage});

  factory UserApplianceModel.fromJson(Map<String, dynamic> json) =>
      _$UserApplianceModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserApplianceModelToJson(this);
}
