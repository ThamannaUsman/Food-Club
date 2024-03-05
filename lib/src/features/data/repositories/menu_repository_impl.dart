import 'package:food_club/src/features/data/data_source/menu/menu_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/data_source/menu/menu_firebase_remote_data_source_impl.dart';
import 'package:food_club/src/features/domain/entities/menu_entity.dart';
import 'package:food_club/src/features/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuFirebaseRemoteDataSource remoteDataSource =
      MenuFirebaseRemoteDataSourceImpl();

  @override
  Future<List<MenuEntity>> getDessert() async =>
      await remoteDataSource.getDessert();

  @override
  Future<List<MenuEntity>> getDrinks() async =>
      await remoteDataSource.getDrinks();

  @override
  Future<List<MenuEntity>> getIceCream() async =>
      await remoteDataSource.getIceCream();

  @override
  Future<List<MenuEntity>> getNonVegFood() async =>
      await remoteDataSource.getNonVegFood();

  @override
  Future<List<MenuEntity>> getSideDish() async =>
      await remoteDataSource.getSideDish();

  @override
  Future<List<MenuEntity>> getVegFood() async =>
      await remoteDataSource.getVegFood();
}
