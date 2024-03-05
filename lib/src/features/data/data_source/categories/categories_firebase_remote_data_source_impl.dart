import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/core/utils/utils.dart';
import 'package:food_club/src/features/data/data_source/categories/categories_firebase_remote_data_source.dart';
import 'package:food_club/src/features/domain/entities/categories_entity.dart';

class CategoriesFirebaseRemoteDataSourceImpl
    implements CategoryFirebaseRemoteDataSource {
  @override
  Future<List<CategoryEntity>> getChineseFood() async {
    try {
      return await chineseFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getIndianFood() async {
    try {
      return await indianFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getItalianFood() async {
    try {
      return await italianFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getJapaneseFood() async {
    try {
      return await japaneseFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getPakistaniFood() async {
    try {
      return await pakistaniFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getSpanishFood() async {
    try {
      return await spanishFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getThaiFood() async {
    try {
      return await thaiFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getTurkishFood() async {
    try {
      return await turkishFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryEntity>> getAllFood() async {
    try {
      return await allFoodCollection.get().then((value) => value.docs
          .map((e) => CategoryEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }
}
