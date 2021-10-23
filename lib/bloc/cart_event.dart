part of 'cart_bloc.dart';

//yaptığımız etkinliğin aracısı
class CartEvent {
  final String productName;
  final DateTime timestamp;

  CartEvent({required this.productName, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}
