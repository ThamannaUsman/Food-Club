import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_club/src/features/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel(
      {required super.subTotalPrice,
      required super.deliveryFee,
      required super.totalPrice,
      required super.orders,
      required super.name,
      required super.address,
      required super.phoneNumber,
      required super.paymentMethod,
      required super.orderBy,
      required super.orderDate});

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(
        subTotalPrice: snapshot.get('subTotalPrice'),
        deliveryFee: snapshot.get('delivery_fee'),
        totalPrice: snapshot.get('total_Price'),
        orders: snapshot.get('order'),
        name: snapshot.get('name'),
        address: snapshot.get('address'),
        phoneNumber: snapshot.get('phoneNumber'),
        paymentMethod: snapshot.get('paymentMethod'),
        orderBy: snapshot.get('order_by'),
        orderDate: snapshot.get('order_date'));
  }

  Map<String, dynamic> toDocument() {
    return {
      "subTotalPrice": subTotalPrice,
      "delivery_fee": deliveryFee,
      "total_Price": totalPrice,
      "order": orders,
      "name": name,
      "address": address,
      "phoneNumber": phoneNumber,
      "paymentMethod": paymentMethod,
      "order_by": orderBy,
      "order_date": orderDate
    };
  }
}
