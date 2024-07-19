import 'package:flutter_homework/data/api/models/rick_and_morty_character_model.dart';
import 'package:flutter_homework/data/api/models/rick_and_morty_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rick_and_morty_model.g.dart';
@JsonSerializable()
class RickAndMortyModel {
  InfoModel? info;
  List<CharacterModel>? results;

  factory RickAndMortyModel.fromJson(Map<String, dynamic> json) =>
      _$RickAndMortyModelFromJson(json);

  RickAndMortyModel({
    this.info,
    this.results,
  });

  Map<String, dynamic> toJson() => _$RickAndMortyModelToJson(this);
}