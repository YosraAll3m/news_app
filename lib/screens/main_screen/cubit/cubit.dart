import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/screens/main_screen/cubit/states.dart';
import 'package:news_app/screens/sciences/science.dart';
import 'package:news_app/screens/sports/sport.dart';
import 'package:news_app/shared_preferences/shared_preferences.dart';

import '../../busniess/busniess.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(InitialNewsStates());

  static NewsCubit get(context)=>BlocProvider.of(context);
  List<Widget> screens=[
    Business(),
    Sport(),
    Science(),

  ];
  List<BottomNavigationBarItem> bottomNavItems=[

  BottomNavigationBarItem(label: "Health",icon: Icon(Icons.health_and_safety_outlined)),
  BottomNavigationBarItem(label: "Sports",icon: Icon(Icons.sports_basketball_sharp)),
  BottomNavigationBarItem(label: "Science",icon: Icon(Icons.science_rounded)),



  ];
  int currentIndex=0;
  void changeIndex(value){
    currentIndex=value;
    if(value==1){
      getSportData();}
    if(value==2){
      getScienceData();}

    emit(BottomBarNewsStates());
  }
  List<dynamic>health=[];

  void getHealthData(){
    emit(NewsHealthLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'health',
          'apiKey': '60c0f90b6582441abfd7ce1ef7dc76ef',
        }

    ).then((value) {
      health=value.data["articles"];
      emit(GetHealthNewsSuccessState());
      print(health[0]['title']);

    }).catchError((error){
      print(error.toString());
      emit(GetHealthNewsErrorState(error.toString()));


    });

  }

  List<dynamic>sport=[];

  void getSportData(){
    if(sport.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '60c0f90b6582441abfd7ce1ef7dc76ef',
          }

      ).then((value) {
        sport=value.data["articles"];
        emit(GetSportNewsSuccessState());
        print(sport[0]['title']);

      }).catchError((error){
        print(error.toString());
        emit(GetSportNewsErrorState(error.toString()));


      });
    }else {
      emit(GetSportNewsSuccessState());
    }
  }

  List<dynamic>science=[];

  void getScienceData(){
    emit(NewsScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '60c0f90b6582441abfd7ce1ef7dc76ef',
          }

      ).then((value) {
        science=value.data["articles"];
        emit(GetScienceNewsSuccessState());
        print(science[0]['title']);

      }).catchError((error){
        print(error.toString());
        emit(GetScienceNewsErrorState(error.toString()));


      });
    }
    else{
      emit(GetScienceNewsSuccessState());

    }


  }

  List<dynamic>search=[];

  void getSearchData(String value){
    emit(NewsSearchLoadingState());
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey': 'cec85adb98c9466695edac5ea1cdf75f'
        },

      ).then((value) {
        search=value.data["articles"];
        emit(GetSearchNewsSuccessState());
        print(search[0]['title']);

      }).catchError((error){
        print(error.toString());
        emit(GetSearchNewsErrorState(error.toString()));


      });



  }
  void clearSearchData(String value){
    emit(NewsSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey': 'cec85adb98c9466695edac5ea1cdf75f'
      },

    ).then((value) {
      search=value.data[" "];
      emit(GetSearchNewsSuccessState());
      print(search[0]['title']);

    }).catchError((error){
      print(error.toString());
      emit(GetSearchNewsErrorState(error.toString()));


    });



  }


  bool isDark=false;

  void changeAppTheme({bool fromShared}){
    if(fromShared!=null)
      {
        isDark=fromShared;
      }
    else {
      isDark = !isDark;
      SharedPrefs.setData(key: 'isDark', value: isDark);
      emit(ChangeTheme());
    }


  }

}