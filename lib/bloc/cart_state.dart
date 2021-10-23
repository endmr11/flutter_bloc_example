part of 'cart_bloc.dart';

//setState yerine geçen kısım

// ignore: must_be_immutable
class CartState extends Equatable {
  final List<dynamic> addedProducts;
  const CartState(this.addedProducts);

  @override
  List<Object?> get props => [addedProducts];
}
