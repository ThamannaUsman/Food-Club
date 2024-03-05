part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<WishlistEntity> wishlistEntity;
  final List<String> wishlistId;

  const WishlistLoaded(
      {required this.wishlistEntity, required this.wishlistId});

  @override
  List<Object> get props => [wishlistEntity, wishlistId];
}

class WishlistSuccess extends WishlistState {
  final List<String> wishlistId;

  const WishlistSuccess({required this.wishlistId});

  @override
  List<Object> get props => [wishlistId];
}

class WishlistError extends WishlistState {
  final String errorMessage;

  const WishlistError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
