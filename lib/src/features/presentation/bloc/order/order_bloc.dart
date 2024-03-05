


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';

import '../../../domain/entities/order_entity.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderConfirmEvent>(_orderConfirmEvent);
  }
  void _orderConfirmEvent(OrderConfirmEvent event, Emitter<OrderState> emit) async {
     await orderUseCase.orderConfirm(event.orderEntity);
  }
}
