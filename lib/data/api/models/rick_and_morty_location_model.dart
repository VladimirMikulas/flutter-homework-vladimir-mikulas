import 'package:json_annotation/json_annotation.dart';

part 'rick_and_morty_location_model.g.dart';
@JsonSerializable()
class LocationModel {
  String? name;
  String? url;
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  LocationModel({
    this.name,
    this.url,
  });

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}


