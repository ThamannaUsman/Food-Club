part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> category;

  const CategoryLoaded({required this.category});

  @override
  List<Object> get props => [category];
}

class CategoryError extends CategoryState {
  final String errorMessage;

  const CategoryError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
