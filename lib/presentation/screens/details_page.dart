import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:movie_app/presentation/widgets/description_part.dart';
import 'package:movie_app/presentation/widgets/my_app_bar.dart';
import 'package:movie_app/presentation/widgets/show_error.dart';

import 'package:movie_app/provider/details_page_providers.dart';

class DetailsPage extends StatelessWidget {
  final String id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return ref.watch(detailProvider(id)).when(
                error: (e, s) => Scaffold(
                    appBar: AppBar(),
                    body: ShowError(
                      error: e.toString(),
                    )),
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (data) {
                  return SuccessWidget(movie: data);
                },
              );
        },
      ),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final Movie movie;
  const SuccessWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: movie.id,
            child: Image.network(
              movie.fullImageUrl500,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SafeArea(child: MyAppBar()),
            DescriptionPart(movie: movie)
          ],
        )
      ],
    );
  }
}
