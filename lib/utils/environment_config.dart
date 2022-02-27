import 'package:flutter_riverpod/flutter_riverpod.dart';

final environmentConfigProvider =
    Provider<EnvironmentConfig>((_) => EnvironmentConfig());

class EnvironmentConfig {
  final movieApiKey = "c2d983e131e48ca5396bd4f34b16f647";
}
