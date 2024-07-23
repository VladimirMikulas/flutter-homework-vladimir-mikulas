import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/data/rick_and_morty_repository.dart';
import 'package:flutter_homework/presentation/screens/characters/bloc/characters_bloc.dart';

class FilterFab extends StatelessWidget {
  FilterFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              onPressed: () {
                var snackBar = SnackBar(content: Text('Character status filter set to ${state.characterStatusFilter.nextStatus
                    .name}'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.read<CharactersBloc>().add(
                      GetNextStatusFilterCharacters(),
                    );
              },
              child: const Icon(Icons.filter_list_alt),
            ),
          ],
        );
      },
    );
  }
}
