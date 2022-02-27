import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:movie_app/presentation/widgets/cast_tile.dart';
import 'package:movie_app/presentation/widgets/social_media_text.dart';

import 'package:movie_app/provider/details_page_providers.dart';

class DescriptionPart extends StatelessWidget {
  final Movie movie;
  const DescriptionPart({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.4),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                child: Text(
                  movie.title.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                child: Text(
                  movie.overview ?? "",
                  style: const TextStyle(color: Colors.white),
                  maxLines: 5,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SocialMediaText(
                    header: "2.5m",
                    type: "Likes",
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SocialMediaText(
                    header: "640k",
                    type: "Following",
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SocialMediaText(
                    header: "220",
                    type: "Followers",
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, child) {
                  return ref
                      .watch(castFutureProvider(movie.id.toString()))
                      .when(
                        error: (e, s) => Scaffold(
                            body: Center(child: Text("Error:${e.toString()}"))),
                        loading: () => const Center(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        data: (d) {
                          if (d != null) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Colors.white.withOpacity(0.1)),
                              height: 130,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CastTile(cast: d[index]!);
                                },
                                itemCount: d.length,
                              ),
                            );
                          } else {
                            return const Text(
                              "NULL",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            );
                          }
                        },
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
