import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'appliance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApplianceModel {
  String name;
  double consumption;
  double standbyConsumption;
  String category;

  ApplianceModel(
      {@required this.name,
      @required this.category,
      @required this.consumption,
      @required this.standbyConsumption})
      : assert(name != null &&
            consumption != null &&
            standbyConsumption != null &&
            category != null);

  factory ApplianceModel.fromJson(Map<String, dynamic> json) =>
      _$ApplianceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApplianceModelToJson(this);
}
