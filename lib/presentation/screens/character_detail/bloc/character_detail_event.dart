part of 'character_detail_bloc.dart';



class CharacterDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCharacterDetail extends CharacterDetailEvent {
  GetCharacterDetail({
    required this.characterId,
  });
  final int characterId;
  @override
  List<Object?> get props => [characterId];
}

