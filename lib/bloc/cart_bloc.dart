import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initialState) : super(initialState);
  List sepettekiUrunler = [];
  @override
  //Etkinliğin gerçekleştirilmesi
  Stream<CartState> mapEventToState(CartEvent event) async* {
    CartState newState;
    sepettekiUrunler.add(event.urunAdi);
    newState = CartState(sepettekiUrunler);
    yield newState;
  }

  void urunEkle(String gelenUrunAdi) {
    add(
      CartEvent(urunAdi: gelenUrunAdi),
    );
  }
}
