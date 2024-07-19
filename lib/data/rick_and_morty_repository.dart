import 'package:dio/dio.dart';
import 'package:flutter_homework/data/api/models/rick_and_morty_model.dart';
import 'package:flutter_homework/data/api/rick_and_morty_rest_client.dart';

import 'api/models/rick_and_morty_character_model.dart';

enum CharacterStatus {
  alive('alive'),
  dead('dead'),
  unknown('unknown'),
  all('');

  const CharacterStatus(this.value);

  final String value;
}

extension CharacterStatusX on CharacterStatus {
  bool get isAlive => this == CharacterStatus.alive;
  bool get isDead => this == CharacterStatus.dead;
  bool get isUnknown => this == CharacterStatus.unknown;
  bool get isAll => this == CharacterStatus.all;
}

class RickAndMortyRepository {
  final _restClient = RickAndMortyRestClient(Dio());

  Future<RickAndMortyModel> getRickAndMortyCharacters(int page, CharacterStatus status) =>
      _restClient.getCharacters(page, status.value);

  Future<CharacterModel> getCharacter(int id) =>
      _restClient.getCharacter(id);
}
