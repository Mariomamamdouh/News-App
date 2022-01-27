import 'package:news_app/shared/appcubit/appstates.dart';
import 'package:bloc/bloc.dart';
import'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  bool isDark=false;

  void changeAppMode({bool? fromshared}){
    if(fromshared !=null){
      isDark=fromshared;
    }
    else {
      isDark = !isDark;
      CacheHelper.putBoolen(key: 'isDark', value: isDark).then((value) =>
          emit(ChangeAppModeState()));
    }

  }
}