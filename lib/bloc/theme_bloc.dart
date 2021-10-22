import 'package:bloc/bloc.dart';

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
    add(
      ThemeEvent(isLight: val),
    );

    print("değiş");
  }
}
