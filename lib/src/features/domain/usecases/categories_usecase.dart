import 'package:food_club/src/features/data/repositories/categories_repository_impl.dart';
import 'package:food_club/src/features/domain/entities/categories_entity.dart';
import 'package:food_club/src/features/domain/repositories/categories_repository.dart';

class CategoryUseCase {
  final CategoryRepository categoriesRepository = CategoryRepositoryImpl();

  Future<List<CategoryEntity>> getChineseFood() {
    return categoriesRepository.getChineseFood();
  }

  Future<List<CategoryEntity>> getIndianFood() {
    return categoriesRepository.getIndianFood();
  }

  Future<List<CategoryEntity>> getItalianFood() {
    return categoriesRepository.getItalianFood();
  }

  Future<List<CategoryEntity>> getPakistaniFood() {
    return categoriesRepository.getPakistaniFood();
  }

  Future<List<CategoryEntity>> getSpanishFood() {
    return categoriesRepository.getSpanishFood();
  }

  Future<List<CategoryEntity>> getTurkishFood() {
    return categoriesRepository.getTurkishFood();
  }

  Future<List<CategoryEntity>> getJapaneseFood() {
    return categoriesRepository.getJapaneseFood();
  }

  Future<List<CategoryEntity>> getThaiFood() {
    return categoriesRepository.getThaiFood();
  }

  Future<List<CategoryEntity>> getAllFood() {
    return categoriesRepository.getAllFood();
  }
}
