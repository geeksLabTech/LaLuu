import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'user_appliance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserApplianceModel {
  ApplianceModel applianceModel;
  Map<String, double> usage;
  String tag;

  UserApplianceModel(
      {@required this.applianceModel,
      @required this.usage,
      @required this.tag});

  factory UserApplianceModel.fromJson(Map<String, dynamic> json) =>
      _$UserApplianceModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserApplianceModelToJson(this);
}
