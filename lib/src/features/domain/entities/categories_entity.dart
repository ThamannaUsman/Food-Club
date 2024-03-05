import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String name;
  final String image;
  final int price;
  final int time;
  final String calories;
  final double rating;
  final String desc;
  final bool isRecommended;
  final bool isMostPopular;
  final String id;

  const CategoryEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.time,
    required this.calories,
    required this.rating,
    required this.desc,
    required this.isRecommended,
    required this.isMostPopular,
    required this.id,
  });

  Map<String, dynamic> toDocument() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'time': time,
      'calories': calories,
      'rating': rating,
      'desc': desc,
      'isRecommended': isRecommended,
      'isMostPopular': isMostPopular,
      'id': id
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
        name: doc['name'],
        image: doc['image'],
        price: doc['price'],
        time: doc['time'],
        calories: doc['calories'],
        rating: doc['rating'],
        desc: doc['desc'],
        isRecommended: doc['isRecommended'],
        isMostPopular: doc['isMostPopular'],
        id: doc['id']);
  }

  @override
  List<Object?> get props => [
        name,
        image,
        price,
        time,
        calories,
        rating,
        desc,
        isRecommended,
        isMostPopular,
        id
      ];
}
