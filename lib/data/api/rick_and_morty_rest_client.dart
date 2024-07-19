import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import 'models/rick_and_morty_character_model.dart';
import 'models/rick_and_morty_model.dart';

part 'rick_and_morty_rest_client.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
abstract class RickAndMortyRestClient {
  factory RickAndMortyRestClient(Dio dio) = _RickAndMortyRestClient;

  @GET('/character')
  Future<RickAndMortyModel> getCharacters(@Query('page') int page, @Query('status') String status);

  @GET('/character/{id}')
  Future<CharacterModel> getCharacter(@Path('id') int id);
}
