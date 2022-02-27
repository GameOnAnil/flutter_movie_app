import 'package:flutter/material.dart';
import 'package:movie_app/data/model/cast.dart';

class CastTile extends StatelessWidget {
  final Cast cast;
  const CastTile({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              cast.fullProfileW300,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(cast.name!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
