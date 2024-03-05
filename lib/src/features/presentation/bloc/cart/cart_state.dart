part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

// class CartLoading extends CartState {}
//
// class CartLoaded extends CartState {
//   final CartEntity cartEntity;
//
//   const CartLoaded({required this.cartEntity});
//
//   @override
//   List<Object> get props => [cartEntity];
// }

class CartError extends CartState {
  final String errorMessage;

  const CartError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
