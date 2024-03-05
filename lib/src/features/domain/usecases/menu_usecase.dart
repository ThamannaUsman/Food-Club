import 'package:food_club/src/features/data/repositories/menu_repository_impl.dart';
import 'package:food_club/src/features/domain/entities/menu_entity.dart';
import 'package:food_club/src/features/domain/repositories/menu_repository.dart';

class MenuUseCase {
  final MenuRepository menuRepository = MenuRepositoryImpl();

  Future<List<MenuEntity>> getVegFood() {
    return menuRepository.getVegFood();
  }

  Future<List<MenuEntity>> getNonVegFood() {
    return menuRepository.getNonVegFood();
  }

  Future<List<MenuEntity>> getSideDish() {
    return menuRepository.getSideDish();
  }

  Future<List<MenuEntity>> getDrinks() {
    return menuRepository.getDrinks();
  }

  Future<List<MenuEntity>> getDessert() {
    return menuRepository.getDessert();
  }

  Future<List<MenuEntity>> getIceCream() {
    return menuRepository.getIceCream();
  }
}
