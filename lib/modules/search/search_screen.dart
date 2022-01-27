import 'package:flutter/material.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context,state){},
      builder:(context,state){
        var list=NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(leading: IconButton(icon:const Icon(Icons.arrow_back_ios_sharp),onPressed: (){Navigator.pop(context);},)
            ,title: const Text("Search"),),
          body:Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultTextFormField(
                context: context,
                controller: searchController,
                type: TextInputType.text,
                validate: (String? val) {
                  if (val!.isEmpty) {
                    return "Please Type Here";
                  }
                },

                label: "Type here to Search",
            //    prefix: Icons.search,
                onchange:(value)
                {
                  NewsCubit.get(context).getSearch(value);

                },),
            ),
            Expanded(child: ListArticleItems(list,isSearch: true))
          ],)
      );}
    );

    }
  }
