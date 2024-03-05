import 'package:food_club/src/features/data/data_source/wishlist/wishlist_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/data_source/wishlist/wishlist_firebase_remote_data_source_impl.dart';
import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';
import 'package:food_club/src/features/domain/repositories/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistFirebaseRemoteDataSource remoteDataSource =
      WishlistFirebaseRemoteDataSourceImpl();

  @override
  Future<void> addToWishList(WishlistEntity wishlistEntity) async =>
      await remoteDataSource.addToWishList(wishlistEntity);

  @override
  Future<void> removeToWishList(WishlistEntity wishlistEntity) async =>
      await remoteDataSource.removeToWishList(wishlistEntity);

  @override
  Future<List<WishlistEntity>> getWishlistData() async =>
      await remoteDataSource.getWishlistData();
}
