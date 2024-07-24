import 'package:dio/dio.dart';
import 'package:flutter_homework/data/api/models/rick_and_morty_episode_model.dart';
import 'package:flutter_homework/data/api/models/rick_and_morty_model.dart';
import 'package:flutter_homework/data/api/rick_and_morty_rest_client.dart';

import 'api/models/rick_and_morty_character_model.dart';

enum CharacterStatusFilter {
  alive('alive'),
  dead('dead'),
  unknown('unknown'),
  all('');

  const CharacterStatusFilter(this.value);

  final String value;
}

extension CharacterStatusFilterX on CharacterStatusFilter {
  bool get isAlive => this == CharacterStatusFilter.alive;

  bool get isDead => this == CharacterStatusFilter.dead;

  bool get isUnknown => this == CharacterStatusFilter.unknown;

  bool get isAll => this == CharacterStatusFilter.all;

  CharacterStatusFilter get nextStatus {
    switch (this) {
      case CharacterStatusFilter.alive:
        return CharacterStatusFilter.dead;
      case CharacterStatusFilter.dead:
        return CharacterStatusFilter.unknown;
      case CharacterStatusFilter.unknown:
        return CharacterStatusFilter.all;
      default:
        return CharacterStatusFilter.alive;
    }
  }
}

class RickAndMortyRepository {
  final _restClient = RickAndMortyRestClient(Dio());

  Future<RickAndMortyModel> getRickAndMortyCharacters(
          int page, CharacterStatusFilter status) async =>
      _restClient.getCharacters(page, status.value);

  Future<CharacterModel> getCharacter(int id) async =>
      _restClient.getCharacter(id);

  Future<List<EpisodeModel>> getEpisodes(List<String> ids) async =>
      _restClient.getEpisodes(ids);
}
