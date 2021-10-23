import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initialState) : super(initialState);
  List<dynamic> productsInCart = [];
  @override
  //Etkinliğin gerçekleştirilmesi
  Stream<CartState> mapEventToState(CartEvent event) async* {
    CartState newState;
    productsInCart.add(event.productName);
    newState = CartState(List.of(productsInCart));
    yield newState;
  }

  void urunEkle(String incomingProductName) {
    add(CartEvent(productName: incomingProductName));
  }
}
