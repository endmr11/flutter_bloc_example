import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kullanimi1/helpers/shared_fontsize.dart';
part 'fontsize_event.dart';
part 'fontsize_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc(FontSizeState initialState) : super(initialState);
  double? number;
  @override
  //Etkinliğin gerçekleştirilmesi
  Stream<FontSizeState> mapEventToState(FontSizeEvent event) async* {
    FontSizeState newState;
    number = event.fontSize;
    newState = FontSizeState(number!);
    yield newState;
  }

  void changeFontSize(double incomingFontSize) {
    FontSizeShared().saveFontSizeSharedPref(incomingFontSize);
    // ignore: avoid_print
    print("değiş");
    add(
      FontSizeEvent(fontSize: incomingFontSize),
    );

    // ignore: avoid_print
    print(incomingFontSize);
  }
}
