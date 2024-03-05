import 'package:food_club/src/features/domain/entities/categories_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getIndianFood();

  Future<List<CategoryEntity>> getChineseFood();

  Future<List<CategoryEntity>> getItalianFood();

  Future<List<CategoryEntity>> getPakistaniFood();

  Future<List<CategoryEntity>> getTurkishFood();

  Future<List<CategoryEntity>> getSpanishFood();

  Future<List<CategoryEntity>> getJapaneseFood();

  Future<List<CategoryEntity>> getThaiFood();

  Future<List<CategoryEntity>> getAllFood();
}
