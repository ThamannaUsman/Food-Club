import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:food_club/src/features/domain/entities/wishlist_entity.dart';

class WishlistModel extends WishlistEntity {
  const WishlistModel(
      {required super.name,
      required super.image,
      required super.price,
      required super.time,
      required super.calories,
      required super.rating,
      required super.desc,
      required super.id});
}
