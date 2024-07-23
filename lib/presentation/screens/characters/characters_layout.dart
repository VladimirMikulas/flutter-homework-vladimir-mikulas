import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/presentation/screens/characters/bloc/characters_bloc.dart';
import 'package:flutter_homework/presentation/screens/characters/widgets/characters_list_view.dart';
import 'package:flutter_homework/presentation/screens/characters/widgets/error_widget.dart';

class CharactersLayout extends StatelessWidget {
  CharactersLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        return state.status.isSuccess ||
                state.status.isLoadingMore ||
                state.status.isLoadedAll
            ? CharactersListView()
            : state.status.isLoading
                ? Center(child: CircularProgressIndicator())
                : state.status.isError
                    ? ErrorCharactersWidget()
                    : const SizedBox();
      },
    );
  }
}
