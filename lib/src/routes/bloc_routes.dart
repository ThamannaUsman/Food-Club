import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/features/domain/usecases/categories_usecase.dart';
import 'package:food_club/src/features/domain/usecases/menu_usecase.dart';
import 'package:food_club/src/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/cart/cart_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/category/category_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/credential/credential_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/menu/menu_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/order/order_bloc.dart';
import 'package:food_club/src/features/presentation/bloc/wishlist/wishlist_bloc.dart';


class AppBlocProviders{
  static get allBlocProviders=>[
    BlocProvider(create: (context) => AuthBloc()..add(IsSignInEvent())),
    BlocProvider(create: (context) => CredentialBloc()),
    BlocProvider(create: (context) => CategoryBloc(CategoryUseCase())),
    BlocProvider(create: (context) => MenuBloc(MenuUseCase())),
    BlocProvider(create: (context) => CartBloc()),
    BlocProvider(create: (context) => OrderBloc()),
    BlocProvider(create: (context) => WishlistBloc()),
  ];
}