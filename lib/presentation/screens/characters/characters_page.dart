import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/data/rick_and_morty_repository.dart';
import 'package:flutter_homework/presentation/screens/characters/bloc/characters_bloc.dart';
import 'package:flutter_homework/presentation/screens/characters/characters_layout.dart';
import 'package:flutter_homework/presentation/screens/characters/widgets/filter_fab.dart';
import 'package:flutter_homework/presentation/widgets/app_back_button.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RickAndMortyRepository(),
      child: BlocProvider<CharactersBloc>(
        create: (context) => CharactersBloc(
          rickAndMortyRepository: context.read<RickAndMortyRepository>(),
        )..add(GetCharacters()),
        child: Scaffold(
          appBar: AppBar(
              leading: AppBackButton(),
              title: Text('Rick and Morty characters')),
          body: SafeArea(child: CharactersLayout()),
          floatingActionButton: FilterFab(),
        ),
      ),
    );
  }
}
