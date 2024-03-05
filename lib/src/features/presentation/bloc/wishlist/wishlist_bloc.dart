import 'dart:async';


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';


part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  List<String> wishlistId = [];

  WishlistBloc() : super(WishlistInitial()) {
    on<AddToWishlistEvent>(_addToWishlistEvent);
    on<RemoveToWishlistEvent>(_removeToWishlistEvent);
    on<GetWishlistDataEvent>(_getWishlistDataEvent);

  }

  void _addToWishlistEvent(AddToWishlistEvent event,
      Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      wishlistId.add(event.wishlistEntity.id);
      await wishlistUseCase.addToCart(event.wishlistEntity);
      emit(WishlistSuccess(wishlistId: wishlistId));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }

  void _removeToWishlistEvent(RemoveToWishlistEvent event,
      Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      wishlistId.remove(event.wishlistEntity.id);
      await wishlistUseCase.removeToCart(event.wishlistEntity);
      emit(WishlistSuccess(wishlistId: wishlistId));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }

  void _getWishlistDataEvent(GetWishlistDataEvent event,
      Emitter<WishlistState> emit) async {
    try {

      List<WishlistEntity> wishlistEntity = await wishlistUseCase
          .getWishlistData();
      wishlistId.addAll(wishlistEntity.map((e) => e.id).toList());
      emit(WishlistLoaded(
          wishlistEntity: wishlistEntity, wishlistId: wishlistId));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }
}


