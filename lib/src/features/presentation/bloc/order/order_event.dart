part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}
class OrderConfirmEvent extends OrderEvent{
  final OrderEntity orderEntity;

  const OrderConfirmEvent({required this.orderEntity});

  @override
  List<Object?> get props => [orderEntity];

}