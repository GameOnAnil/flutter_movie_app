import 'package:flutter/material.dart';
import 'package:movie_app/presentation/screens/details_page.dart';
import 'package:movie_app/presentation/screens/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomePage());
      case "/details":
        if (args is String) {
          return MaterialPageRoute(builder: (_) {
            return DetailsPage(id: args);
          });
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text("Error"),
          ),
        );
      },
    );
  }
}
