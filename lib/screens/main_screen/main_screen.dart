import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/screens/main_screen/cubit/cubit.dart';
import 'package:news_app/screens/main_screen/cubit/states.dart';
import 'package:news_app/screens/search/search.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return
   //   BlocProvider(create: (BuildContext context)=>NewsCubit()..getHealthData(),
   BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
     builder: (context,state)=>
         Scaffold(
       appBar: AppBar(
         actions: [IconButton(onPressed: (){
           Navigator.push(context,
             MaterialPageRoute(builder: (context) =>  SearchScreen()),
           );
         },icon:Icon(Icons.search)),
           IconButton(
               onPressed: (){
           NewsCubit.get(context).changeAppTheme();
           },icon:Icon(Icons.brightness_4_sharp)),

         ],
         title: Text("News App"),

         ),
       body: NewsCubit.get(context).screens[NewsCubit.get(context).currentIndex],
       bottomNavigationBar: BottomNavigationBar(

         currentIndex:NewsCubit.get(context).currentIndex ,
         onTap: (value){
            NewsCubit.get(context).changeIndex(value);
         },
         items: NewsCubit.get(context).bottomNavItems
       ),
   //   )
   //
   // ),



   ));

  }
}