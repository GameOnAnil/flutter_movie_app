import 'package:flutter/material.dart';

class SocialMediaText extends StatelessWidget {
  final String header;
  final String type;
  const SocialMediaText({
    Key? key,
    required this.header,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          header,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 28, color: Colors.white),
        ),
        Text(
          type,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
