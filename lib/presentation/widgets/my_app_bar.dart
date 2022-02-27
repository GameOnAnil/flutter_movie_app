import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/custom_icon_button.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        const Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomIconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            CustomIconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
