

import 'package:flutter_homework/data/api/models/rick_and_morty_episode_model.dart';

class EpisodeUiModel {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;


  EpisodeUiModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  EpisodeUiModel toEpisodeUiModel(EpisodeModel model) {
    return EpisodeUiModel(
      id: model.id ?? -1,
      name: model.name ?? '',
      airDate: model.air_date ?? '',
      episode: model.episode ?? '',
    );
  }
}
