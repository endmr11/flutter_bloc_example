part of 'fontsize_bloc.dart';

class FontSizeState extends Equatable {
  final double fontSize;

  const FontSizeState(this.fontSize);

  @override
  List<Object?> get props => [fontSize];
}
