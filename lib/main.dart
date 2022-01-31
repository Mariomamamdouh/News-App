import 'package:flutter/material.dart';
import 'package:news_app/modules/onboarding/onboarding_screens.dart';
import 'package:news_app/shared/appcubit/appcubit.dart';
import 'package:news_app/shared/appcubit/appstates.dart';
import 'package:news_app/shared/blocobserver.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'layout/news_layout/cubit/cubit.dart';

import "package:flutter_bloc/flutter_bloc.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: "isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness()..getScience()..getSports()..getTechnology(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              AppCubit()..changeAppMode(fromshared: isDark),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              home:OnBoardingScreen(),
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          }),
    );
  }
}
