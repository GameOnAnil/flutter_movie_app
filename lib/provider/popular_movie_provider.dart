import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:movie_app/data/network/movie_service.dart';

final movieFutureProvider =
    FutureProvider.autoDispose<List<Movie>?>((ref) async {
  ref.maintainState = true;
  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});
