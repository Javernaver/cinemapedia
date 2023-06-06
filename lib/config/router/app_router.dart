import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/screens/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(
          childView: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: HomeView.name,
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';

                  return MovieScreen(movieId: movieId);
                }),
          ],
        ),
        GoRoute(
          path: '/favorites',
          name: FavoritesView.name,
          builder: (context, state) => const FavoritesView(),
        ),
      ],
    ),

    // RUTAS PADRE / HIJO
    // GoRoute(
    //   path: '/',
    //   name: HomeScreen.name,
    //   builder: (context, state) => const HomeScreen(
    //     childView: HomeView(),
    //   ),
    // ),
    // GoRoute(
    //     path: '/movie/:id',
    //     name: MovieScreen.name,
    //     builder: (context, state) {
    //       final movieId = state.pathParameters['id'] ?? 'no-id';

    //       return MovieScreen(movieId: movieId);
    //     }),
  ],
);
