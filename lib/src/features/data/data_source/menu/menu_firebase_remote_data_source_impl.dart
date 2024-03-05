import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/data/data_source/menu/menu_firebase_remote_data_source.dart';
import 'package:food_club/src/features/domain/entities/menu_entity.dart';

class MenuFirebaseRemoteDataSourceImpl implements MenuFirebaseRemoteDataSource {
  @override
  Future<List<MenuEntity>> getDessert() async {
    try {
      return await dessertCollection.get().then((value) =>
          value.docs.map((e) => MenuEntity.fromDocument(e.data())).toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MenuEntity>> getDrinks() async {
    try {
      return await drinksCollection.get().then((value) =>
          value.docs.map((e) => MenuEntity.fromDocument(e.data())).toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MenuEntity>> getIceCream() async {
    try {
      return await iceCreamCollection.get().then((value) =>
          value.docs.map((e) => MenuEntity.fromDocument(e.data())).toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MenuEntity>> getNonVegFood() async {
    try {
      return await nonVegFoodCollection.get().then((value) =>
          value.docs.map((e) => MenuEntity.fromDocument(e.data())).toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MenuEntity>> getSideDish() async {
    try {
      return await sideDishCollection.get().then((value) =>
          value.docs.map((e) => MenuEntity.fromDocument(e.data())).toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MenuEntity>> getVegFood() async {
    try {
      return await vegFoodCollection.get().then((value) =>
          value.docs.map((e) => MenuEntity.fromDocument(e.data())).toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }
}
