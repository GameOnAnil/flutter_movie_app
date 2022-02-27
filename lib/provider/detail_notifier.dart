import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:movie_app/data/network/movie_service.dart';

class DetailNotifier extends StateNotifier<AsyncValue<Movie>> {
  final MovieService movieService;
  final String id;
  DetailNotifier(AsyncValue<Movie> state, this.movieService, this.id)
      : super(state) {
    fetchMovie();
  }

  Future<void> fetchMovie() async {
    try {
      state = const AsyncValue.loading();
      Movie? movie = await movieService.getMovieDetial(id);
      state = AsyncValue.data(movie);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
