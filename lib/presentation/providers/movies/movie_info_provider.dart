import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_repository_provider.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider).getMovieById;

  return MovieMapNotifier(getMovie: movieRepository);
});

/*
 * {
 *  'movieId': Movie,
 * } 
 * 
 */

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    // Si la pelicula ya existe en el estado, no la cargamos
    if (state[movieId] != null) return;

    // Cargamos la pelicula y la guardamos en el estado
    final movie = await getMovie(movieId);
    state = {
      ...state,
      movieId: movie,
    };
  }
}