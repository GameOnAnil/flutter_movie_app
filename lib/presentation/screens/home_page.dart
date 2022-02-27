import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:movie_app/presentation/widgets/show_error.dart';
import 'package:movie_app/provider/popular_movie_provider.dart';
import 'package:movie_app/utils/custom_exception.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(movieFutureProvider).when(
                  error: (e, s) => ShowError(error: e.toString()),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  data: (movies) {
                    if (movies != null) {
                      return RefreshIndicator(
                        onRefresh: () {
                          return ref.refresh(movieFutureProvider.future);
                        },
                        child: GridView.extent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.7,
                          children: movies.map((e) {
                            print(e.title);
                            log(e.toString());
                            return CustomTile(
                              movie: e,
                            );
                          }).toList(),
                        ),
                      );
                    }

                    return Text("No Data");
                  },
                );
          },
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final Movie movie;
  const CustomTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/details",
              arguments: movie.id.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Hero(
                  tag: movie.id,
                  child: Image.network(
                    movie.fullImageUrl300,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black45, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.0, 0.4]),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5.0),
                  child: Text(
                    movie.title ?? "null",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
