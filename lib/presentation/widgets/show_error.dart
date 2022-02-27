import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  final String error;
  const ShowError({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/error.png")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("ERROR: " + error.toString()),
          ),
        ],
      ),
    );
  }
}
