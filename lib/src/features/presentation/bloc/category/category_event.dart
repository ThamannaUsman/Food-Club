part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class IndianFoodEvent extends CategoryEvent{}

class ChineseFoodEvent extends CategoryEvent{}

class ItalianFoodEvent extends CategoryEvent{}

class PakistaniFoodEvent extends CategoryEvent{}

class TurkishFoodEvent extends CategoryEvent{}

class SpanishFoodEvent extends CategoryEvent{}

class JapaneseFoodEvent extends CategoryEvent{}

class ThaiFoodEvent extends CategoryEvent{}

class AllFoodEvent extends CategoryEvent{}


