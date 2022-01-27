import 'package:flutter/material.dart';
import "package:flutter/widgets.dart";
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/component/component.dart';
import'package:flutter_bloc/flutter_bloc.dart';
class TechnologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).technology;

        return ListArticleItems(list);
      },
    );
  }

}