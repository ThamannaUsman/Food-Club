import 'package:food_club/src/features/domain/entities/menu_entity.dart';

class MenuModel extends MenuEntity {
  const MenuModel(
      {required super.name,
      required super.image,
      required super.price,
      required super.time,
      required super.calories,
      required super.rating,
      required super.desc,
      required super.id});

  MenuEntity toEntity() {
    return MenuEntity(
        name: name,
        image: image,
        price: price,
        time: time,
        calories: calories,
        rating: rating,
        desc: desc,
        id: id);
  }
}
