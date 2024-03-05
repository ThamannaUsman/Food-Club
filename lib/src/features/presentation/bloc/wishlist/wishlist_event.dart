part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}
class AddToWishlistEvent extends WishlistEvent{
  final WishlistEntity wishlistEntity;

  const AddToWishlistEvent({required this.wishlistEntity,});

  @override
  List<Object?> get props => [wishlistEntity];

}

class RemoveToWishlistEvent extends WishlistEvent{
  final WishlistEntity wishlistEntity;

  const RemoveToWishlistEvent({required this.wishlistEntity});

  @override
  List<Object?> get props => [wishlistEntity,];

}

class GetWishlistDataEvent extends WishlistEvent{
  @override
  List<Object?> get props => [];
}

