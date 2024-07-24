import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/presentation/screens/character_detail/bloc/character_detail_bloc.dart';
import 'package:flutter_homework/presentation/screens/character_detail/widgets/character_detail_item.dart';
import 'package:flutter_homework/presentation/screens/character_detail/widgets/episode_detail_item.dart';

import '../../../data/api/models/rick_and_morty_character_model.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/error_loading_data_widget.dart';

class CharacterDetailLayout extends StatelessWidget {
  CharacterDetailLayout({required this.characterId});

  final int characterId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
        builder: (context, state) {
      return state.status.isLoading
          ? Center(child: CircularProgressIndicator())
          : state.status.isError
              ? ErrorLoadingDataWidget()
              : state.status.isSuccess
                  ? Scaffold(
                      appBar: AppBar(
                        leading: AppBackButton(),
                        title: Text(state.characterDetail.name),
                      ),
                      body: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: Hero(
                                    tag: state.characterDetail.id,
                                    child: Image(height:200,width: 200,
                                      image: NetworkImage(
                                          state.characterDetail.image),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        state.characterDetail.species,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(
                                          (state.characterDetail.gender ==
                                                  Gender.Male)
                                              ? Icons.male
                                              : (state.characterDetail.gender ==
                                                      Gender.Female)
                                                  ? Icons.female
                                                  : Icons.block,
                                          size: 32)
                                    ]),
                                const SizedBox(
                                  height: 22,
                                ),
                                Expanded(
                                  child: ListView(
                                      children: [
                                      CharacterDetailItem(
                                          label: 'Type:',
                                          data: state.characterDetail.type),
                                      CharacterDetailItem(
                                          label: 'Last known location:',
                                          data: state.characterDetail
                                              .lastLocationName),
                                      CharacterDetailItem(
                                          label: 'Episodes:', data: ''),
                                      for (final episode
                                          in state.characterDetail.episodes)
                                        EpisodeDetailItem(
                                            episodeNumber:
                                                episode.episode ?? '',
                                            name: episode.name ?? '',
                                            releaseDate: episode.airDate ?? '')

                        ],
                      ),
                            ),]
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
    });
  }
}
