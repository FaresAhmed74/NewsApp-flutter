abstract class NewsState {}
class NewsIntialState extends NewsState{}
class NewsNavbarState extends NewsState {}
class NewsGetBusinessDataSuccessState extends NewsState{}
class NewsGetBusinessDataErrorState extends NewsState{
  final String error;
  NewsGetBusinessDataErrorState(this.error);
}
class NewsLoadingState extends NewsState{}
class NewsGetSportDataSuccessState extends NewsState{}
class NewsGetSportDataErrorState extends NewsState{
  final String error;
  NewsGetSportDataErrorState(this.error);
}
class NewsSportLoadingState extends NewsState{}
class NewsGetScienceDataSuccessState extends NewsState{}
class NewsGetScienceDataErrorState extends NewsState{
  final String error;
  NewsGetScienceDataErrorState(this.error);
}
class NewsScienceLoadingState extends NewsState{}


