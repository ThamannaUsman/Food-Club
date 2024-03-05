import 'package:food_club/src/features/data/repositories/cart_repository_impl..dart';
import 'package:food_club/src/features/domain/entities/cart_entity.dart';
import 'package:food_club/src/features/domain/repositories/cart_repository.dart';

class CartUseCase {
  final CartRepository cartRepository = CartRepositoryImpl();

  Future<void> addToCart(CartEntity cartEntity) {
    return cartRepository.addToCart(cartEntity);
  }
}
