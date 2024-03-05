import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';

abstract class WishlistRepository {
  Future<void> addToWishList(WishlistEntity wishlistEntity);

  Future<void> removeToWishList(WishlistEntity wishlistEntity);

  Future<List<WishlistEntity>> getWishlistData();
}
