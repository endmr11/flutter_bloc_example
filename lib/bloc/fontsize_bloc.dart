import 'package:flutter_bloc/flutter_bloc.dart';
part 'fontsize_event.dart';
part 'fontsize_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc(FontSizeState initialState) : super(initialState);
  double? sayi;
  @override
  //Etkinliğin gerçekleştirilmesi
  Stream<FontSizeState> mapEventToState(FontSizeEvent event) async* {
    FontSizeState newState;
    sayi = event.fontSize;
    newState = FontSizeState(sayi!);
    yield newState;
  }

  void changeFontSize(double gelenFontSize) {
    add(
      FontSizeEvent(fontSize: gelenFontSize),
    );

    // ignore: avoid_print
    print(gelenFontSize);
  }
}
