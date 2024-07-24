part of 'character_detail_bloc.dart';

enum CharacterDetailStatus { initial, success, error, loading }

extension CharacterDetailStatusX on CharacterDetailStatus {
  bool get isInitial => this == CharacterDetailStatus.initial;

  bool get isSuccess => this == CharacterDetailStatus.success;

  bool get isError => this == CharacterDetailStatus.error;

  bool get isLoading => this == CharacterDetailStatus.loading;
}

class CharacterDetailState extends Equatable {
  CharacterDetailState(
      {this.status = CharacterDetailStatus.initial,
      CharacterDetailUiModel? characterDetail})
      : characterDetail = characterDetail ??
      emptyCharacterDetailUiModel();

  final CharacterDetailUiModel characterDetail;
  final CharacterDetailStatus status;

  @override
  List<Object?> get props => [status, characterDetail];

  CharacterDetailState copyWith({
    CharacterDetailUiModel? characterDetail,
    CharacterDetailStatus? status,
  }) {
    return CharacterDetailState(
        characterDetail: characterDetail ?? this.characterDetail,
        status: status ?? this.status);
  }
}
