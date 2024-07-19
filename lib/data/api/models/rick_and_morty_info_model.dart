import 'package:json_annotation/json_annotation.dart';

part 'rick_and_morty_info_model.g.dart';
@JsonSerializable()
class InfoModel {
  int? count;
  int? pages;
  String? next;
  String? prev;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  InfoModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
