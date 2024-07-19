import 'package:flutter_homework/presentation/router/paths.dart';
import 'package:flutter_homework/presentation/router/routes.dart';
import 'package:flutter_homework/presentation/routes/main_route.dart';
import 'package:go_router/go_router.dart';

import '../routes/characters_route.dart';

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
        builder: (context, state) => const CharactersRoute(),
      ),
    ],
  );
}
