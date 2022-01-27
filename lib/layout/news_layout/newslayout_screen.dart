import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/appcubit/appcubit.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? news}) : super(key: news);

  @override
  Widget build(BuildContext context) {
    /* return BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, NewsState states) {},
        builder: (BuildContext context, NewsState states) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
              actions: [
                IconButton(
                    onPressed: () {
                      navigatoTo(context, SearchScreen());
                      NewsCubit.get(context).search=[];
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 40.0,
                    )),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).changeAppMode();
                    }, icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
            body: cubit.screens[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomitems,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeindexBottomNavBar(index);
              },
            ),
          );
        });*/
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, NewsState states) {},
        builder: (BuildContext context, NewsState states) {
          var cubit = NewsCubit.get(context);
          return DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("News App"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          navigatoTo(context, SearchScreen());
                          NewsCubit.get(context).search = [];
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 40.0,
                        )),
                    IconButton(
                        onPressed: () {
                          AppCubit.get(context).changeAppMode();
                        },
                        icon: const Icon(Icons.brightness_2_sharp)),
                  ],
                  bottom: TabBar(
                    tabs: cubit.tabs,
                    onTap: (index) {
                      cubit.changeindexBottomNavBar(index);
                    },
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.teal,
                    labelColor: Colors.teal,
                  ),
                ),
                body: TabBarView(children: cubit.screens),
              ));
        });
  }
}
