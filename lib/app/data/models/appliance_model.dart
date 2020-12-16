import 'package:json_annotation/json_annotation.dart';
part 'appliance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApplianceModel {
  String name;
  double consumption;
  String category;

  ApplianceModel({this.name, this.consumption});

  factory ApplianceModel.fromJson(Map<String, dynamic> json) =>
      _$ApplianceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApplianceModelToJson(this);
}
