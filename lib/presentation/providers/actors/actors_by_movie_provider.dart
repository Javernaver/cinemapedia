import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorsRepositoryProvider).getActorsByMovie;

  return ActorsByMovieNotifier(getActors: actorRepository);
});

/*
 * {
 *  'movieId': <Actor>[],
 * } 
 * 
 */

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;
  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    // Si la pelicula ya existe en el estado, no la cargamos
    if (state[movieId] != null) return;

    // Cargamos la pelicula y la guardamos en el estado
    final actors = await getActors(movieId);
    state = {
      ...state,
      movieId: actors,
    };
  }
}
