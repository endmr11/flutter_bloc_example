part of 'theme_bloc.dart';

class ThemeEvent {
  final bool isLight;
  final DateTime timestamp;

  ThemeEvent({required this.isLight, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}
