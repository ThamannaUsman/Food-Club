import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_club/src/features/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.image,
    required super.name,
    required super.price,
    required super.quantity,
    required super.totalPrice,
    required super.addedBy,
  });

  factory CartModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CartModel(
        image: snapshot.get('image'),
        name: snapshot.get('name'),
        price: snapshot.get('price'),
        quantity: snapshot.get('quantity'),
        totalPrice: snapshot.get('totalPrice'),
        addedBy: snapshot.get('added_by'));
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "quantity": quantity,
      "totalPrice": totalPrice,
      "added_by": addedBy
    };
  }
}
