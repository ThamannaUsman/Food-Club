import 'package:food_club/src/core/constants/firebase_const.dart';

import 'package:food_club/src/features/data/data_source/order/order_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/model/order_model.dart';

import 'package:food_club/src/features/domain/entities/order_entity.dart';

class OrderFirebaseRemoteDataSourceImpl
    implements OrderFirebaseRemoteDataSource {
  @override
  Future<void> orderConfirm(OrderEntity orderEntity) async {
    orderCollection.doc().get().then((value) {
      final order = OrderModel(
              subTotalPrice: orderEntity.subTotalPrice,
              deliveryFee: orderEntity.deliveryFee,
              totalPrice: orderEntity.totalPrice,
              orders: orderEntity.orders,
              name: orderEntity.name,
              address: orderEntity.address,
              phoneNumber: orderEntity.phoneNumber,
              paymentMethod: orderEntity.paymentMethod,
              orderBy: orderEntity.orderBy,
              orderDate: orderEntity.orderDate)
          .toDocument();
      orderCollection.doc().set(order);
      return;
    });
  }
}
