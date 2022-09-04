import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/main_screen/cubit/cubit.dart';
import 'package:news_app/screens/main_screen/cubit/states.dart';
import 'package:news_app/widget/default_text_feild.dart';

import '../../widget/news_item.dart';

class SearchScreen extends StatelessWidget{
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=>NewsCubit()..search,
      child: BlocConsumer<NewsCubit,NewsStates>(
            listener: (context,NewsStates states){},
            builder: (context,NewsStates states){
              var list=NewsCubit.get(context).search;
              return  Scaffold(
                appBar: AppBar(),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: DefaultTextFeild(
                        controller: searchController,
                        text: "Search",
                        onChange: (value){
                          NewsCubit.get(context).getSearchData(value);
                        },
                        icon: Icon(Icons.search,color: Color(0xff103176 )),

                         keyboardType: TextInputType.text,
                        validate: (String value){
                          if(value.isEmpty){
                            print(" enter data!!");
                          }
                          else{
                            return null;
                          }
                        },


                      ),

                    ),
                   Expanded(
                     child: Padding(padding: EdgeInsets.all(20),
                       child:   ListView.separated(itemBuilder: (context,index)=>
                           NewsItem(list[index],context),
                         separatorBuilder: (context,index)=>SizedBox(height: 25,),
                         itemCount: list.length ),)

                   ),

                                  ],
                ),
              );
            }

        ),
    );

  }
}