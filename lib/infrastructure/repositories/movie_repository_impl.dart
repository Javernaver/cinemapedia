import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource datasouerce;

  MovieRepositoryImpl(this.datasouerce);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasouerce.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasouerce.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasouerce.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasouerce.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasouerce.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query, {int page = 1}) {
    return datasouerce.searchMovies(query, page: page);
  }
}
