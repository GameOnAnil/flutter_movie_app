import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/data/model/cast.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/utils/custom_exception.dart';
import 'package:movie_app/utils/environment_config.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);

  return MovieService(config, Dio());
});

class MovieService {
  MovieService(this._environment, this._dio);
  final EnvironmentConfig _environment;
  final Dio _dio;

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=${_environment.movieApiKey}&page=1");

      final jsonResult =
          List<Map<String, dynamic>>.from(response.data["results"]);
      List<Movie> movies =
          jsonResult.map((movie) => Movie.fromMap(movie)).toList();

      return movies;
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }

  Future<Movie> getMovieDetial(String id) async {
    try {
      final response = await _dio.get(
          "https://api.themoviedb.org/3/movie/${id}?api_key=c2d983e131e48ca5396bd4f34b16f647&language=en-US");
      final jsonResult = Map<String, dynamic>.from(response.data);

      Movie movie = Movie.fromMap(jsonResult);
      return movie;
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<List<Cast>> getMovieCasts(String id) async {
    try {
      final response = await _dio.get(
          "https://api.themoviedb.org/3/movie/$id/credits?api_key=c2d983e131e48ca5396bd4f34b16f647&language=en-US");
      final jsonResult = List<Map<String, dynamic>>.from(response.data["cast"]);

      List<Cast> casts =
          jsonResult.map((movie) => Cast.fromMap(movie)).toList();
      debugPrint(casts.toString());
      return casts;
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e);
    }
  }
}
