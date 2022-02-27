import 'package:movie_app/data/model/cast.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:movie_app/data/network/movie_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/detail_notifier.dart';

final castFutureProvider = FutureProvider.family
    .autoDispose<List<Cast?>?, String>((ref, String id) async {
  ref.maintainState = true;
  final movieService = ref.read(movieServiceProvider);
  final casts = await movieService.getMovieCasts(id);
  return casts;
});

final detailProvider =
    StateNotifierProvider.family<DetailNotifier, AsyncValue<Movie>, String>(
        (ref, String id) {
  final movieService = ref.read(movieServiceProvider);
  return DetailNotifier(const AsyncValue.loading(), movieService, id);
});
