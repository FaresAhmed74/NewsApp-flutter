import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/module/business/business_screen.dart';
import 'package:newsapp/module/science/sport_screen.dart';
import 'package:newsapp/module/settings/settings_screen.dart';
import 'package:newsapp/module/sport/sport_screen.dart';

import '../../network/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{

  NewsCubit(): super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

 int currentIndex=0;
 List<BottomNavigationBarItem> bottomItems=[
   BottomNavigationBarItem(icon: Icon(Icons.business_center_rounded),label:'Business' ),
   BottomNavigationBarItem(icon: Icon(Icons.science_rounded),label:'Science' ),
   BottomNavigationBarItem(icon: Icon(Icons.sports_football_rounded),label:'Sports' ),
   BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Settings' )

 ];

 List<Widget> screens=[
   businessScreen(),
   scienceScreen(),
   sportScreen(),
   settingsScreen(),
 ];
 List<dynamic> businessData=[];
  List<dynamic> sportData=[];
  List<dynamic> scienceData=[];
  List<dynamic> searchData=[];


  void changeCurrentIndex(int index){
   currentIndex=index;
   if(index==1)
     {
       getScienceDate();
     }
   if(index==2)
     {
       getSportDate();
     }
   emit(NewsNavbarState());
 }
 void getBusinessDate(){
  emit(NewsLoadingState());
  DioHelper.getData(url: 'v2/top-headlines', query: {
     'country':'us',
     'category':'business',
     'apiKey':'62d46362f33346c39060d9cc7751942e',
   }).then((value) {
      businessData=value.data['articles'];
      print('businessData size is ${businessData.length}');
      emit(NewsGetBusinessDataSuccessState());
   }).catchError((error){
     print(error.toString());
     emit(NewsGetBusinessDataErrorState(error.toString()));
   });
 }
 void getScienceDate(){
    emit(NewsLoadingState());
    if(scienceData.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'us',
        'category':'science',
        'apiKey':'62d46362f33346c39060d9cc7751942e',
      }).then((value) {
        scienceData=value.data['articles'];
        print('Science Data size is ${scienceData.length}');
        emit(NewsGetScienceDataSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceDataErrorState(error.toString()));
      });
    }
    else
      {
        emit(NewsGetScienceDataSuccessState());
      }

  }
  void getSportDate(){
    emit(NewsLoadingState());
    if(sportData.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'us',
        'category':'sport',

        'apiKey':'62d46362f33346c39060d9cc7751942e',
      }).then((value) {
        sportData=value.data['articles'];
        print('sportData size is ${sportData.length}');
        emit(NewsGetSportDataSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportDataErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetSportDataSuccessState());
    }

  }
  void getSearchData(String q){
    emit(NewsLoadingState());
    if(searchData.isEmpty){
      DioHelper.getData(url: 'v2/everything', query: {
         'q':'$q',
        'apiKey':'62d46362f33346c39060d9cc7751942e',
      }).then((value) {
        searchData=value.data['articles'];
        print('searchData size is ${searchData.length}');
        emit(NewsGetSportDataSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportDataErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetSportDataSuccessState());
    }
  }

}