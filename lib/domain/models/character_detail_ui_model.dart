

import '../../data/api/models/rick_and_morty_character_model.dart';

class CharacterDetailUiModel {
  final int id;
  final String name;
  final Status species;
  final Gender type;
  final String lastLocationName;
  final String image;
  final List<String> listOfEpisodes;

  CharacterDetailUiModel({
    required this.id,
    required this.name,
    required this.species,
    required this.type,
    required this.lastLocationName,
    required this.image,
    required this.listOfEpisodes,

  });
}

CharacterDetailUiModel toCharacterDetailUiModel(CharacterModel model) {
  return CharacterDetailUiModel(
    id: model.id ?? -1,
    name: model.name ?? '',
    species: model.status ?? Status.UNKNOWN,
    type: model.gender ?? Gender.UNKNOWN,
    lastLocationName: model.location?.name ?? '',
    image: model.image ?? '',
    listOfEpisodes: model.episode?.map((e) => e.split("/").last).toList() ?? List.empty()
  );
}
