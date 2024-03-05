import 'package:food_club/src/features/domain/entities/cart_entity.dart';

abstract class CartRepository{
Future<void> addToCart(CartEntity cartEntity);
}