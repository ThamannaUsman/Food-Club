import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable {
  final String name;
  final String image;
  final int price;
  final int time;
  final String calories;
  final double rating;
  final String desc;
  final String id;

  const WishlistEntity(
      {required this.name,
      required this.image,
      required this.price,
      required this.time,
      required this.calories,
      required this.rating,
      required this.desc,
      required this.id});

  Map<String, dynamic> toDocument() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'time': time,
      'calories': calories,
      'rating': rating,
      'desc': desc,
      'id': id
    };
  }

  static WishlistEntity fromDocument(Map<String, dynamic> doc) {
    return WishlistEntity(
        name: doc['name'],
        image: doc['image'],
        price: doc['price'],
        time: doc['time'],
        calories: doc['calories'],
        rating: doc['rating'],
        desc: doc['desc'],
        id: doc['id']);
  }

  @override
  List<Object?> get props =>
      [name, image, price, time, calories, rating, desc, id];
}
