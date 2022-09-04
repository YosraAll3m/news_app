import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/screens/main_screen/cubit/cubit.dart';
import 'package:news_app/screens/main_screen/cubit/states.dart';
import 'package:news_app/screens/main_screen/main_screen.dart';
import 'package:news_app/shared_preferences/shared_preferences.dart';

import 'network/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
await  SharedPrefs.init();
final isDark=SharedPrefs.getData(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool isDark;
   MyApp(this.isDark, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getHealthData()..
      changeAppTheme(fromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){

          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Color(0xff103176),
                scaffoldBackgroundColor: Colors.white,
                floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:  Color(0xff103176),),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white,
                  selectedItemColor:  Color(0xff103176),elevation: 20,
                  type: BottomNavigationBarType.fixed,

                ),
                appBarTheme: AppBarTheme(backgroundColor:  Color(0xff103176),titleTextStyle: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold))
            ),
            darkTheme: ThemeData(
                primaryColor: Color(0xff3F4246),
                scaffoldBackgroundColor: Color(0xff3F4246),
                floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:  Color(0xff3F4246),),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color(0xff3F4246),
                  selectedItemColor:  Colors.white,elevation: 20,
                  type: BottomNavigationBarType.fixed,

                ),
                appBarTheme: AppBarTheme(backgroundColor:  Color(0xff3F4246),titleTextStyle: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold))
            ),
            themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home:MainScreen() ,
          );
        },
      )

    );
  }
}

