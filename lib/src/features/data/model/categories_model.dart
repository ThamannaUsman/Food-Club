import 'package:food_club/src/features/domain/entities/categories_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(
      {required super.name,
      required super.image,
      required super.price,
      required super.time,
      required super.calories,
      required super.rating,
      required super.desc,
      required super.isRecommended,
      required super.isMostPopular,
      required super.id});

  CategoryEntity toEntity() {
    return CategoryEntity(
        name: name,
        image: image,
        price: price,
        time: time,
        calories: calories,
        rating: rating,
        desc: desc,
        isRecommended: isRecommended,
        isMostPopular: isMostPopular,
        id: id);
  }
}
