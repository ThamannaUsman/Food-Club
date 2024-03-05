import 'package:food_club/src/features/domain/entities/menu_entity.dart';

abstract class MenuFirebaseRemoteDataSource {
  Future<List<MenuEntity>> getVegFood();

  Future<List<MenuEntity>> getNonVegFood();

  Future<List<MenuEntity>> getSideDish();

  Future<List<MenuEntity>> getDessert();

  Future<List<MenuEntity>> getIceCream();

  Future<List<MenuEntity>> getDrinks();
}
