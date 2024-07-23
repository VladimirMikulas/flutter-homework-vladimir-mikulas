

import '../../data/api/models/rick_and_morty_character_model.dart';

class CharacterItemUiModel {
  final int id;
  final String name;
  final Status status;
  final Gender gender;
  final String lastLocationName;
  final String image;

  CharacterItemUiModel({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.lastLocationName,
    required this.image,
  });
}

CharacterItemUiModel toCharacterItemUiModel(CharacterModel model) {
  return CharacterItemUiModel(
    id: model.id ?? -1,
    name: model.name ?? '',
    status: model.status ?? Status.unknown,
    gender: model.gender ?? Gender.unknown,
    lastLocationName: model.location?.name ?? '',
    image: model.image ?? '',
  );
}
