import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/data/rick_and_morty_repository.dart';

import '../../../../domain/models/character_item_ui_model.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({
    required this.rickAndMortyRepository,
  }) : super(const CharactersState()) {
    on<GetCharacters>(_mapGetCharactersEventToState);
    on<GetMoreCharacters>(_mapGetMoreCharactersEventToState);
    on<GetNextStatusFilterCharacters>(
        _mapGetNextStatusFilterCharactersEventToState);
  }

  final RickAndMortyRepository rickAndMortyRepository;

  void _mapGetCharactersEventToState(
      GetCharacters event, Emitter<CharactersState> emit) async {
    emit(state.copyWith(status: CharactersStatus.loading));

    await rickAndMortyRepository
        .getRickAndMortyCharacters(state.nextPage, state.characterStatusFilter)
        .then((characters) {
      emit(
        state.copyWith(
          status: CharactersStatus.success,
          characters: characters.results?.map(toCharacterItemUiModel).toList(),
          nextPage: state.nextPage + 1,
        ),
      );
    }).catchError((error) {
      emit(state.copyWith(status: CharactersStatus.error));
    });
  }

  void _mapGetMoreCharactersEventToState(
      GetMoreCharacters event, Emitter<CharactersState> emit) async {
    if (state.status.isLoadingMore || state.status.isLoadedAll) {
      return;
    }
    emit(state.copyWith(status: CharactersStatus.loadingMore));

    await rickAndMortyRepository
        .getRickAndMortyCharacters(state.nextPage, state.characterStatusFilter)
        .then((characters) {
      emit(
        state.copyWith(
          status: CharactersStatus.success,
          characters: List.of(state.characters)
            ..addAll(characters.results?.map(toCharacterItemUiModel) ?? []),
          nextPage: state.nextPage + 1,
          reachedLastPage: characters.info?.pages == state.nextPage,
        ),
      );
      if (state.reachedLastPage) {
        emit(state.copyWith(status: CharactersStatus.loadedAll));
      }
    }).catchError((error) {
      emit(state.copyWith(status: CharactersStatus.error));
    });
  }

  void _mapGetNextStatusFilterCharactersEventToState(
      GetNextStatusFilterCharacters event,
      Emitter<CharactersState> emit) async {
    emit(state.copyWith(
        status: CharactersStatus.loading,
        nextPage: 1,
        characterStatusFilter: state.characterStatusFilter.nextStatus,
        reachedLastPage: false));

    await rickAndMortyRepository
        .getRickAndMortyCharacters(state.nextPage, state.characterStatusFilter)
        .then((characters) {
      emit(
        state.copyWith(
            status: CharactersStatus.success,
            characters:
                characters.results?.map(toCharacterItemUiModel).toList(),
            nextPage: state.nextPage + 1),
      );
    }).catchError((error) {
      emit(state.copyWith(status: CharactersStatus.error));
    });
  }
}
