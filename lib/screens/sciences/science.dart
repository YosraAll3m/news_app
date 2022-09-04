import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/main_screen/cubit/cubit.dart';
import 'package:news_app/screens/main_screen/cubit/states.dart';

import '../../widget/news_item.dart';

class Science extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,NewsStates states){},
        builder: (context,NewsStates states){
          var list=NewsCubit.get(context).science;
          return  Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(itemBuilder: (context,index)=>NewsItem(list[index],context),
                separatorBuilder: (context,index)=>SizedBox(height: 25,),
                itemCount: list.length ),

          );
        }

    );
  }
}