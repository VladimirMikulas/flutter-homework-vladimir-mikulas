import 'package:flutter_homework/presentation/router/paths.dart';
import 'package:flutter_homework/presentation/router/routes.dart';
import 'package:flutter_homework/presentation/screens/character_detail/character_detail_page.dart';
import 'package:flutter_homework/presentation/screens/main/main_route.dart';
import 'package:go_router/go_router.dart';

import '../screens/characters/characters_page.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: RoutesInfo.mainRouteInfo,
    routes: [
      GoRoute(
        path: Paths.mainPath,
        builder: (context, state) => const MainRoute(),
      ),
      GoRoute(
        path: Paths.charactersPath,
        builder: (context, state) => const CharactersPage(),
      ),
      GoRoute(
        path: Paths.characterDetailPath,
        builder: (context, state) {
          int characterId = state.extra as int;
          return CharacterDetailsPage(characterId: characterId);
        },
      ),
    ],
  );
}
