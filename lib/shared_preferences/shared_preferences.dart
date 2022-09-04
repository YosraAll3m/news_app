import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

  static SharedPreferences sharedPreferences;
  static init()
  async{
     sharedPreferences = await SharedPreferences.getInstance();


  }

static  Future<bool> setData({
  @required String key,
    @required bool value
}   )async{
   await sharedPreferences.setBool(key, value);
  }

  static bool getData({@required String key,}){
    sharedPreferences.getBool(key);
  }
}