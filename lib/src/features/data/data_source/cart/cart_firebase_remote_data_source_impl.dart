import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/features/data/model/cart_model.dart';
import 'package:food_club/src/features/domain/entities/cart_entity.dart';
import 'cart_firebase_remote_data_source.dart';

class CartFirebaseRemoteDataSourceImpl implements CartFirebaseRemoteDataSource {
  @override
  Future<void> addToCart(CartEntity cartEntity) async {
    cartCollection.doc().get().then((value) {
      final cart = CartModel(
              image: cartEntity.image,
              name: cartEntity.name,
              price: cartEntity.price,
              quantity: cartEntity.quantity,
              totalPrice: cartEntity.totalPrice,
              addedBy: cartEntity.addedBy)
          .toDocument();
      cartCollection.doc().set(cart);
      return;
    });
  }
}
