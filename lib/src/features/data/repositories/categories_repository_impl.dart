import 'package:food_club/src/features/data/data_source/categories/categories_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/data_source/categories/categories_firebase_remote_data_source_impl.dart';
import 'package:food_club/src/features/domain/entities/categories_entity.dart';
import 'package:food_club/src/features/domain/repositories/categories_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryFirebaseRemoteDataSource remoteDataSource =
      CategoriesFirebaseRemoteDataSourceImpl();

  @override
  Future<List<CategoryEntity>> getChineseFood() async =>
      await remoteDataSource.getChineseFood();

  @override
  Future<List<CategoryEntity>> getIndianFood() async =>
      await remoteDataSource.getIndianFood();

  @override
  Future<List<CategoryEntity>> getItalianFood() async =>
      await remoteDataSource.getItalianFood();

  @override
  Future<List<CategoryEntity>> getJapaneseFood() async =>
      await remoteDataSource.getJapaneseFood();

  @override
  Future<List<CategoryEntity>> getPakistaniFood() async =>
      await remoteDataSource.getPakistaniFood();

  @override
  Future<List<CategoryEntity>> getSpanishFood() async =>
      await remoteDataSource.getSpanishFood();

  @override
  Future<List<CategoryEntity>> getThaiFood() async =>
      await remoteDataSource.getThaiFood();

  @override
  Future<List<CategoryEntity>> getTurkishFood() async =>
      await remoteDataSource.getTurkishFood();

  @override
  Future<List<CategoryEntity>> getAllFood() async =>
      await remoteDataSource.getAllFood();
}
