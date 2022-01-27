import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sport/sport.dart';
import 'package:news_app/modules/technology/technology_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());
  int currentindex = 0;
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic>science = [];
  List<dynamic>technology = [];
  List<dynamic>search = [];
  List<BottomNavigationBarItem> bottomitems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: "Science"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_outlined), label: "Sport"),
  ];
  List<Widget> tabs=[
  const Tab(text: "Business",),
    const Tab(text: "Science",),
    const Tab(text: "Sport",),
    const Tab(text: "Technology",),
  ];


  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    TechnologyScreen(),
  ];

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeindexBottomNavBar(int index) {
    currentindex = index;
   /* if (index == 1)
      getscience();

    if (index == 2)
      getsports();*/
    emit(NewsBottomNavBarState());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'business',
        //'apiKey': '29ffd1b875154f28a1dda983ba1415fd',
        'apiKey': '3196bd8631314eac9e2f3e8e84d5bb61',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
  //  if (science.isEmpty) {
      DioHelper.getdata(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'science',
          // 'apiKey': '29ffd1b875154f28a1dda983ba1415fd',
          'apiKey': '3196bd8631314eac9e2f3e8e84d5bb61',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    //}
    //else {
      emit(NewsGetScienceSuccessState());
  //  }
  }

  void getSports() {
    emit(NewsGetSportLoadingState());

      DioHelper.getdata(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'sport',
          //  'apiKey': '29ffd1b875154f28a1dda983ba1415fd',
          'apiKey': '3196bd8631314eac9e2f3e8e84d5bb61',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });
    }


  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());

      DioHelper.getdata(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'technology',
          //  'apiKey': '29ffd1b875154f28a1dda983ba1415fd',
          'apiKey': '3196bd8631314eac9e2f3e8e84d5bb61',
        },
      ).then((value) {
        technology = value.data['articles'];
        print(technology[0]['title']);

        emit(NewsGetTechnologySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
      });

  }

  void getSearch(String word) {
    emit(NewsGetSearchLoadingState());
    //search=[];
    DioHelper.getdata(url: "v2/everything",
      query: {
        'q': "$word",
        // 'apiKey':"29ffd1b875154f28a1dda983ba1415fd",
        'apiKey': '3196bd8631314eac9e2f3e8e84d5bb61',
      },
    ).then((word) {
      search = word.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}