import 'package:food_club/src/features/data/repositories/wishlist_repository_impl.dart';
import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';
import 'package:food_club/src/features/domain/repositories/wishlist_repository.dart';

class WishlistUseCase {
  final WishlistRepository wishlistRepository = WishlistRepositoryImpl();

  Future<void> addToCart(WishlistEntity wishlistEntity) {
    return wishlistRepository.addToWishList(wishlistEntity);
  }

  Future<void> removeToCart(WishlistEntity wishlistEntity) {
    return wishlistRepository.removeToWishList(wishlistEntity);
  }

  Future<List<WishlistEntity>> getWishlistData() {
    return wishlistRepository.getWishlistData();
  }
}
