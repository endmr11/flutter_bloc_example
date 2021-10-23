import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_kullanimi1/helpers/shared_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState);

  bool? isLight;

  @override
  //Etkinliğin gerçekleştirilmesi
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    ThemeState newState;
    isLight = event.isLight;
    newState = ThemeState(isLight!);
    yield newState;
  }

  void changeTheme(bool val) {
    ThemeShared().saveThemeSharedPref(val);
    // ignore: avoid_print
    print("değiş");
    add(
      ThemeEvent(isLight: val),
    );
  }
}
