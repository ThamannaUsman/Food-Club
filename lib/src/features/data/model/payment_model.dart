import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable{
  final String name;
  final int id;

  const PaymentModel({required this.name, required this.id});


  @override
  List<Object?> get props => [name,id];

}

List<PaymentModel> payment=[
  const PaymentModel(name: "Paytm", id: 0),
  const PaymentModel(name: "PayPal", id: 1),
  const PaymentModel(name: "UPI", id: 2),
  const PaymentModel(name: "Cash on delivery", id: 3),
];