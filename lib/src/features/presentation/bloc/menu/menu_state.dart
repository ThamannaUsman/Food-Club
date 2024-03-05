part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<MenuEntity> menu;

  const MenuLoaded({required this.menu});

  @override
  List<Object> get props => [menu];
}

class MenuError extends MenuState {
  final String errorMessage;

  const MenuError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
