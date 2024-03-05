import 'package:equatable/equatable.dart';
import 'package:food_club/src/features/domain/entities/cart_entity.dart';

class OrderEntity extends Equatable {
  final int subTotalPrice;
  final int deliveryFee;
  final int totalPrice;
  final dynamic orders;
  final String name;
  final String address;
  final String phoneNumber;
  final String paymentMethod;
  final String orderBy;
  final String orderDate;

  const OrderEntity(
      {required this.subTotalPrice,
      required this.deliveryFee,
      required this.totalPrice,
      required this.orders,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.paymentMethod,
      required this.orderBy,
      required this.orderDate});

  @override
  List<Object?> get props => [
        subTotalPrice,
        deliveryFee,
        totalPrice,
        orders,
        name,
        address,
        phoneNumber,
        paymentMethod,
        orderBy,
        orderDate
      ];
}
