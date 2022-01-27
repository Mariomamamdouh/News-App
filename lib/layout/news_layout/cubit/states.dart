abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavBarState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessErrorState extends NewsState {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetSportSuccessState extends NewsState {}

class NewsGetSportErrorState extends NewsState {
  final String error;

  NewsGetSportErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsState {}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  final String error;

  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsState {}

class NewsGetTechnologySuccessState extends NewsState {}

class NewsGetTechnologyErrorState extends NewsState {
  final String error;

  NewsGetTechnologyErrorState(this.error);
}

class NewsGetTechnologyLoadingState extends NewsState {}