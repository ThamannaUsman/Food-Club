import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/data/data_source/wishlist/wishlist_firebase_remote_data_source.dart';
import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';

class WishlistFirebaseRemoteDataSourceImpl
    implements WishlistFirebaseRemoteDataSource {
  @override
  Future<void> addToWishList(
    WishlistEntity wishlistEntity,
  ) async {
    wishlistCollection.doc(wishlistEntity.id).set({
      "name": wishlistEntity.name,
      "image": wishlistEntity.image,
      "price": wishlistEntity.price,
      "time": wishlistEntity.time,
      "calories": wishlistEntity.calories,
      "rating": wishlistEntity.rating,
      "desc": wishlistEntity.desc,
      "id": wishlistEntity.id
    });

    Utils().flutterToast("Add to wishlist");
  }

  @override
  Future<void> removeToWishList(
    WishlistEntity wishlistEntity,
  ) async {
    wishlistCollection.doc(wishlistEntity.id).delete();
    Utils().flutterToast("Remove to wishlist");
  }

  @override
  Future<List<WishlistEntity>> getWishlistData() async {
    try {
      return await wishlistCollection.get().then((value) => value.docs
          .map((e) => WishlistEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }
}
