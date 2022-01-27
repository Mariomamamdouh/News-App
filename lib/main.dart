import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/appcubit/appcubit.dart';
import 'package:news_app/shared/appcubit/appstates.dart';
import 'package:news_app/shared/blocobserver.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'layout/news_layout/cubit/cubit.dart';
import 'layout/news_layout/newslayout_screen.dart';
import "package:hexcolor/hexcolor.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:bloc/bloc.dart";

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
              home: NewsScreen(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  textTheme:const  TextTheme(
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black),
                      bodyText2: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.w500)),
                  primarySwatch: Colors.teal,
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      selectedItemColor: Colors.teal,
                      backgroundColor: Colors.white),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                      titleSpacing: 20.0,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      backwardsCompatibility: false,
                      titleTextStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                      ))),
              darkTheme: ThemeData(
                  primarySwatch: Colors.teal,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Colors.teal,
                      backgroundColor: HexColor('0C0C0C'),
                      unselectedItemColor: Colors.grey),
                  scaffoldBackgroundColor: HexColor('0C0C0C'),
                  appBarTheme: AppBarTheme(
                      titleSpacing: 20.0,
                      iconTheme: const IconThemeData(
                        color: Colors.white,
                      ),
                      backgroundColor: HexColor('0C0C0C'),
                      elevation: 0.0,
                      backwardsCompatibility: false,
                      titleTextStyle: const TextStyle(
                          color: Colors.white,                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('0C0C0C'),
                        statusBarIconBrightness: Brightness.light,
                      )),
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                      bodyText2: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500))),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          }),
    );
  }
}
