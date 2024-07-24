import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/data/rick_and_morty_repository.dart';
import 'package:flutter_homework/presentation/screens/character_detail/character_detail_layout.dart';

import 'bloc/character_detail_bloc.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({Key? key, required this.characterId})
      : super(key: key);
  final int characterId;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RickAndMortyRepository(),
      child: BlocProvider<CharacterDetailBloc>(
        create: (context) => CharacterDetailBloc(
          rickAndMortyRepository: context.read<RickAndMortyRepository>(),
        )..add(GetCharacterDetail(characterId: characterId)),
        child: CharacterDetailLayout(characterId: characterId),
      ),
    );
  }
}
