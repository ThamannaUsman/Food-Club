import 'package:food_club/src/features/data/data_source/cart/cart_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/data_source/cart/cart_firebase_remote_data_source_impl.dart';
import 'package:food_club/src/features/domain/entities/cart_entity.dart';
import 'package:food_club/src/features/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartFirebaseRemoteDataSource remoteDataSource =
      CartFirebaseRemoteDataSourceImpl();

  @override
  Future<void> addToCart(CartEntity cartEntity) async =>
      await remoteDataSource.addToCart(cartEntity);
}
