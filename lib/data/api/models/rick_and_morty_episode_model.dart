import 'package:json_annotation/json_annotation.dart';

part 'rick_and_morty_episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  int? id;
  String? name;
  String? air_date;
  String? episode;
  List<String>? characters;
  String? url;
  DateTime? created;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  EpisodeModel({
    this.id,
    this.name,
    this.air_date,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
