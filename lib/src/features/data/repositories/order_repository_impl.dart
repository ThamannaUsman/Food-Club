import 'package:food_club/src/features/data/data_source/order/order_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/data_source/order/order_firebase_remote_data_source_impl.dart';
import 'package:food_club/src/features/domain/entities/order_entity.dart';
import 'package:food_club/src/features/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderFirebaseRemoteDataSource remoteDataSource =
      OrderFirebaseRemoteDataSourceImpl();

  @override
  Future<void> orderConfirm(OrderEntity orderEntity) async =>
      await remoteDataSource.orderConfirm(orderEntity);
}
