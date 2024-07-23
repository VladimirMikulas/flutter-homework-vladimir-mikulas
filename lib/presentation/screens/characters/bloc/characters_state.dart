part of 'characters_bloc.dart';

enum CharactersStatus { initial, success, error, loading, loadingMore, loadedAll }

extension CharactersStatusX on CharactersStatus {
  bool get isInitial => this == CharactersStatus.initial;

  bool get isSuccess => this == CharactersStatus.success;

  bool get isError => this == CharactersStatus.error;

  bool get isLoading => this == CharactersStatus.loading;

  bool get isLoadingMore => this == CharactersStatus.loadingMore;

  bool get isLoadedAll => this == CharactersStatus.loadedAll;
}

class CharactersState extends Equatable {
  const CharactersState(
      {this.status = CharactersStatus.initial,
      List<CharacterItemUiModel>? characters,
      this.characterStatusFilter = CharacterStatusFilter.all,
      this.nextPage = 1,
      this.reachedLastPage = false})
      : characters = characters ?? const [];

  final List<CharacterItemUiModel> characters;
  final CharactersStatus status;
  final CharacterStatusFilter characterStatusFilter;
  final int nextPage;
  final bool reachedLastPage;

  @override
  List<Object?> get props =>
      [status, characters, characterStatusFilter, nextPage, reachedLastPage];

  CharactersState copyWith({
    List<CharacterItemUiModel>? characters,
    CharactersStatus? status,
    CharacterStatusFilter? characterStatusFilter,
    int? nextPage,
    bool? reachedLastPage,
  }) {
    return CharactersState(
        characters: characters ?? this.characters,
        status: status ?? this.status,
        characterStatusFilter:
            characterStatusFilter ?? this.characterStatusFilter,
        nextPage: nextPage ?? this.nextPage,
        reachedLastPage: reachedLastPage ?? this.reachedLastPage);
  }
}
