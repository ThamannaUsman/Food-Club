part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}
 class AddToCartEvent extends CartEvent{
  final CartEntity cartEntity;

  const AddToCartEvent({required this.cartEntity});

  @override
  List<Object?> get props => [cartEntity];

 }


