import 'package:flutter_homework/domain/models/episode_ui_model.dart';

import '../../data/api/models/rick_and_morty_character_model.dart';
import '../../data/api/models/rick_and_morty_episode_model.dart';

class CharacterDetailUiModel {
  final int id;
  final String name;
  final String species;
  final Gender gender;
  final String type;
  final String lastLocationName;
  final String image;
  final List<EpisodeUiModel> episodes;

  CharacterDetailUiModel({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.type,
    required this.lastLocationName,
    required this.image,
    required this.episodes,
  });
}

CharacterDetailUiModel toCharacterDetailUiModel(
    CharacterModel characterModel, List<EpisodeModel> episodeModel) {
  var characterDetailUiModel = CharacterDetailUiModel(
      id: characterModel.id ?? 0,
      name: characterModel.name ?? '',
      species: characterModel.species ?? '',
      gender: characterModel.gender ?? Gender.unknown,
      type: characterModel.type ?? '',
      lastLocationName: characterModel.location?.name ?? '',
      image: characterModel.image ?? '',
      episodes: episodeModel
          .map((e) => EpisodeUiModel(
              id: e.id, name: e.name, airDate: e.air_date, episode: e.episode))
          .toList());
  return characterDetailUiModel;
}

CharacterDetailUiModel emptyCharacterDetailUiModel() => CharacterDetailUiModel(
    id: 0,
    name: '',
    species: '',
    gender: Gender.unknown,
    type: '',
    lastLocationName: '',
    image: '',
    episodes: const []);
