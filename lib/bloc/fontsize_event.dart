part of 'fontsize_bloc.dart';

class FontSizeEvent {
  final double fontSize;
  final DateTime timestamp;

  FontSizeEvent({required this.fontSize, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}
