part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object?> get props => [];
}

class VegFoodEvent extends MenuEvent {}

class NonVegFoodEvent extends MenuEvent {}

class SideDishEvent extends MenuEvent {}


class IceCreamEvent extends MenuEvent {}

class DessertEvent extends MenuEvent {}

class DrinksEvent extends MenuEvent {}




