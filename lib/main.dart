import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_club/src/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_club/src/features/presentation/pages/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:food_club/src/features/presentation/pages/splash_screen/splash_screen.dart';
import 'package:food_club/src/routes/bloc_routes.dart';
import 'src/routes/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routes.controller,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthenticatedState) {
                return BottomNavigationBarWidget(uid: state.uid);
              } else {
                return const SplashScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
