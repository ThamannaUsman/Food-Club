

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_club/src/features/domain/entities/categories_entity.dart';
import 'package:food_club/src/features/domain/usecases/categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
   final CategoryUseCase _categoryUseCase;
   CategoryBloc(this._categoryUseCase) : super(CategoryInitial()) {
     on<IndianFoodEvent>(_indianFoodEvent);
     on<ChineseFoodEvent>(_chineseFoodEvent);
     on<ItalianFoodEvent>(_italianFoodEvent);
     on<PakistaniFoodEvent>(_pakistaniFoodEvent);
     on<SpanishFoodEvent>(_spanishFoodEvent);
     on<TurkishFoodEvent>(_turkishFoodEvent);
     on<JapaneseFoodEvent>(_japaneseFoodEvent);
     on<ThaiFoodEvent>(_thaiFoodEvent);
    on<AllFoodEvent>(_allFoodEvent);
   }

   void _indianFoodEvent(IndianFoodEvent event,Emitter<CategoryState> emit) async{
     emit(CategoryLoading());
     try{
       List<CategoryEntity> category=await _categoryUseCase.getIndianFood();
       emit(CategoryLoaded(category: category));
     }catch(e){
       emit(CategoryError(errorMessage: e.toString()));
     }
   }
  void _chineseFoodEvent(ChineseFoodEvent event,Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      List<CategoryEntity> category=await _categoryUseCase.getChineseFood();
      emit(CategoryLoaded(category: category));
    }catch(e){
      emit(CategoryError(errorMessage: e.toString()));
    }
  }
  void _italianFoodEvent(ItalianFoodEvent event,Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      List<CategoryEntity> category=await _categoryUseCase.getItalianFood();
      emit(CategoryLoaded(category: category));
    }catch(e){
      emit(CategoryError(errorMessage: e.toString()));
    }
  }
  void _pakistaniFoodEvent(PakistaniFoodEvent event,Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      List<CategoryEntity> category=await _categoryUseCase.getPakistaniFood();
      emit(CategoryLoaded(category: category));
    }catch(e){
      emit(CategoryError(errorMessage: e.toString()));
    }
  }
  void _spanishFoodEvent(SpanishFoodEvent event,Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      List<CategoryEntity> category=await _categoryUseCase.getSpanishFood();
      emit(CategoryLoaded(category: category));
    }catch(e){
      emit(CategoryError(errorMessage: e.toString()));
    }
  }
  void _turkishFoodEvent(TurkishFoodEvent event,Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      List<CategoryEntity> category=await _categoryUseCase.getTurkishFood();
      emit(CategoryLoaded(category: category));
    }catch(e){
      emit(CategoryError(errorMessage: e.toString()));
    }
  }
  void _japaneseFoodEvent(JapaneseFoodEvent event,Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      List<CategoryEntity> category=await _categoryUseCase.getJapaneseFood();
      emit(CategoryLoaded(category: category));
    }catch(e){
      emit(CategoryError(errorMessage: e.toString()));
    }
  }
  void _thaiFoodEvent(ThaiFoodEvent event,Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      List<CategoryEntity> category=await _categoryUseCase.getThaiFood();
      emit(CategoryLoaded(category: category));
    }catch(e){
      emit(CategoryError(errorMessage: e.toString()));
    }
  }

   void _allFoodEvent(AllFoodEvent event,Emitter<CategoryState> emit) async{
     emit(CategoryLoading());
     try{
       List<CategoryEntity> category=await _categoryUseCase.getAllFood();
       emit(CategoryLoaded(category: category));
     }catch(e){
       emit(CategoryError(errorMessage: e.toString()));
     }
   }


}
