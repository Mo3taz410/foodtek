import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/features/auth/views/screens/login_screen.dart';
import 'package:foodtek/features/auth/views/screens/reset_password_screen.dart';
import 'package:foodtek/features/cart/controllers/cart_cubit.dart';
import 'package:foodtek/features/checkout/views/screens/checkout_screen.dart';
import 'package:foodtek/features/favorites/controllers/favorites_cubit.dart';
import 'package:foodtek/features/food_details/controllers/food_details_cubit.dart';
import 'package:foodtek/features/food_details/views/screen/food_details_screen.dart';
import 'package:foodtek/features/home/controllers/category_nav_cubit.dart';
import 'package:foodtek/features/app/views/screens/app_screen.dart';
import 'package:foodtek/features/home/views/screen/home_screen.dart';
import 'package:foodtek/features/profile/views/screens/edit_profile_screen.dart';
import 'package:foodtek/features/splash/splash_screen.dart';
import 'core/constants/app_colors.dart';
import 'features/app/controllers/bottom_nav_cubit.dart';
import 'features/app/views/screens/track_screen.dart';
import 'features/auth/controllers/auth_cubit.dart';
import 'features/auth/controllers/remember_me_cubit.dart';
import 'features/auth/views/screens/new_password_screen.dart';
import 'features/auth/views/screens/signup_screen.dart';
import 'features/cart/views/screen/cart_screen.dart';
import 'features/favorites/views/screen/favorites_screen.dart';
import 'features/location/views/screen/location_picker_screen.dart';
import 'features/onboarding/views/screen/onboarding_screen.dart';
import 'features/profile/views/screens/profile_screen.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AuthCubit()),
            BlocProvider(create: (_) => RememberMeCubit()),
            BlocProvider(create: (_) => BottomNavCubit()),
            BlocProvider(create: (_) => CategoryNavCubit()),
            BlocProvider(create: (_) => FavoritesCubit()),
            BlocProvider(create: (_) => FoodDetailsCubit()),
            BlocProvider(create: (_) => CartCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
              fontFamily: 'Poppins',
            ),
            home: AppScreen(), // home: const FoodDetailsPreview(),
            routes: {
              ///  '/': (context) => SplashScreen(),
              '/onboarding': (context) => OnboardingScreen(),
              '/login': (context) => LoginScreen(),
              '/signup': (context) => SignupScreen(),
              '/reset_password': (context) => ResetPasswordScreen(),
              '/new_password': (context) => NewPasswordScreen(),
              '/app': (context) => AppScreen(),
              '/home': (context) => HomeScreen(),
              '/favorites': (context) => FavoritesScreen(),
              '/cart': (context) => CartScreen(),
              '/track': (context) => TrackScreen(),
              '/profile': (context) => ProfileScreen(),
              '/edit_profile': (context) => EditProfileScreen(),
              '/locationPicker': (context) => const LocationPickerScreen(),
              '/food_details': (context) {
                final food =
                    ModalRoute.of(context)!.settings.arguments as FoodModel;
                return BlocProvider.value(
                  value: BlocProvider.of<FoodDetailsCubit>(context),
                  child: FoodDetailsScreen(food: food),
                );
              },
              '/checkout': (context) => CheckoutScreen(),
            },
          ),
        );
      },
    );
  }
}
