import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/data/rick_and_morty_repository.dart';

import '../../../../domain/models/character_detail_ui_model.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  CharacterDetailBloc({
    required this.rickAndMortyRepository,
  }) : super(CharacterDetailState()) {
    on<GetCharacterDetail>(_mapGetCharacterDetailEventToState);
  }

  final RickAndMortyRepository rickAndMortyRepository;

  void _mapGetCharacterDetailEventToState(
      GetCharacterDetail event, Emitter<CharacterDetailState> emit) async {
    emit(state.copyWith(status: CharacterDetailStatus.loading));
    var characterResult;
    await rickAndMortyRepository.getCharacter(event.characterId).then((character) {
      characterResult = character;
    }).catchError((error) {
      emit(state.copyWith(status: CharacterDetailStatus.error));
    });
    await rickAndMortyRepository
        .getEpisodes(_getEpisodeIdsFromUrls(characterResult.episode))
        .then(
      (episodes) {
        emit(state.copyWith(
          status: CharacterDetailStatus.success,
          characterDetail: toCharacterDetailUiModel(
            characterResult,
            episodes,
          ),
        ));
      },
    ).catchError((error) {
      emit(state.copyWith(status: CharacterDetailStatus.error));
    });
  }

  List<String> _getEpisodeIdsFromUrls(List<String>? episodeUrls) {
    return episodeUrls?.map((e) => e.split('/').last).toList() ?? [];
  }
}
