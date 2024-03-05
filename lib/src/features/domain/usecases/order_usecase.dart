import 'package:food_club/src/features/data/repositories/order_repository_impl.dart';
import 'package:food_club/src/features/domain/entities/order_entity.dart';
import 'package:food_club/src/features/domain/repositories/order_repository.dart';

class OrderUseCase {
  final OrderRepository orderRepository = OrderRepositoryImpl();

  Future<void> orderConfirm(OrderEntity orderEntity) {
    return orderRepository.orderConfirm(orderEntity);
  }
}
