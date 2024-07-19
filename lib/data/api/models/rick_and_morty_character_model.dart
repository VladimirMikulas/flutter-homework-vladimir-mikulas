import 'package:flutter_homework/data/api/models/rick_and_morty_location_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'rick_and_morty_character_model.g.dart';
@JsonSerializable()
class CharacterModel {
  int? id;
  String? name;
  Status? status;
  String? species;
  String? type;
  Gender? gender;
  LocationModel? origin;
  LocationModel? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

enum Gender {
  FEMALE,
  MALE,
  GENDERLESS,
  UNKNOWN
}

enum Status {
  ALIVE,
  DEAD,
  UNKNOWN
}


