import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/presentation/screens/characters/bloc/characters_bloc.dart';

import 'bottom_loader.dart';
import 'character_tile.dart';

class CharactersListView extends StatefulWidget {
  CharactersListView({ Key? key}) : super(key: key);

  @override
  State<CharactersListView> createState() => _CharactersListViewState();
}

class _CharactersListViewState extends State<CharactersListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return index >= state.characters.length
                  ? const BottomLoader()
                  : CharacterTile(character: state.characters[index]);
            },
            itemCount: state.status.isLoadedAll
                ? state.characters.length
                : state.characters.length + 1,
            controller: _scrollController,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CharactersBloc>().add(GetMoreCharacters());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
