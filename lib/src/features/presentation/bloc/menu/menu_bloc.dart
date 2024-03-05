import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/features/domain/entities/menu_entity.dart';
import 'package:food_club/src/features/domain/usecases/menu_usecase.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuUseCase _menuUseCase;

  MenuBloc(this._menuUseCase) : super(MenuInitial()) {
    on<VegFoodEvent>(_vegFoodEvent);
    on<NonVegFoodEvent>(_nonVFoodEvent);
    on<SideDishEvent>(_sideDishEvent);
    on<IceCreamEvent>(_iceCreamEvent);
    on<DessertEvent>(_dessertEvent);
    on<DrinksEvent>(_drinksEvent);
  }

  void _vegFoodEvent(VegFoodEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      List<MenuEntity> menu = await _menuUseCase.getVegFood();
      emit(MenuLoaded(menu: menu));
    } catch (e) {
      emit(MenuError(errorMessage: e.toString()));
    }
  }

  void _nonVFoodEvent(NonVegFoodEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      List<MenuEntity> menu = await _menuUseCase.getNonVegFood();
      emit(MenuLoaded(menu: menu));
    } catch (e) {
      emit(MenuError(errorMessage: e.toString()));
    }
  }

  void _sideDishEvent(SideDishEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      List<MenuEntity> menu = await _menuUseCase.getSideDish();
      emit(MenuLoaded(menu: menu));
    } catch (e) {
      emit(MenuError(errorMessage: e.toString()));
    }
  }

  void _iceCreamEvent(IceCreamEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      List<MenuEntity> menu = await _menuUseCase.getIceCream();
      emit(MenuLoaded(menu: menu));
    } catch (e) {
      emit(MenuError(errorMessage: e.toString()));
    }
  }

  void _dessertEvent(DessertEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      List<MenuEntity> menu = await _menuUseCase.getDessert();
      emit(MenuLoaded(menu: menu));
    } catch (e) {
      emit(MenuError(errorMessage: e.toString()));
    }
  }

  void _drinksEvent(DrinksEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      List<MenuEntity> menu = await _menuUseCase.getDrinks();
      emit(MenuLoaded(menu: menu));
    } catch (e) {
      emit(MenuError(errorMessage: e.toString()));
    }
  }
}
