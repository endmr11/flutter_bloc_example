part of 'cart_bloc.dart';

//yaptığımız etkinliğin aracısı
class CartEvent {
  final String urunAdi;
  final DateTime timestamp;

  CartEvent({required this.urunAdi, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}
