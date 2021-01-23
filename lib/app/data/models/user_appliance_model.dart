import 'package:LaLuu/app/data/models/appliance_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'user_appliance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserApplianceModel {
  // In .g file :
  // ApplianceModel.fromJson(Map<String, dynamic>.from(json['applianceModel']))
  // Map<String, dynamic>.from(json['usage'])
  ApplianceModel applianceModel;
  Map<String, double> usage;
  String tag;

  // This three fields will be removed in future versions
  double consumptionOn;
  double consumptionStandby;
  double consumptionTotal;

  UserApplianceModel({
    @required this.applianceModel,
    @required this.usage,
    @required this.tag,
    this.consumptionOn,
    this.consumptionStandby,
    this.consumptionTotal,
  }) : assert(consumptionOn != null &&
            consumptionStandby != null &&
            consumptionTotal != null &&
            applianceModel != null &&
            usage != null &&
            tag != null);

  factory UserApplianceModel.fromJson(Map<String, dynamic> json) =>
      _$UserApplianceModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserApplianceModelToJson(this);
}
