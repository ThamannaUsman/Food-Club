


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/features/domain/entities/cart_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>(_addToCartEvent);

  }
  void _addToCartEvent(AddToCartEvent event, Emitter<CartState> emit) async {
    try {
      await cartUseCase.addToCart(event.cartEntity);
    }  catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }



}
