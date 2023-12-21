import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/module/details_screen.dart';
import 'package:newsapp/module/search_screen.dart';
import 'package:newsapp/network/dio_helper.dart';
import 'package:newsapp/shared/components/components.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessDate(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:Text('News App' ,style: TextStyle(color: Colors.lightGreen),),
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context, SearchScreen());
                }, icon: Icon(Icons.search),)
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeCurrentIndex(index);
              },
              items: cubit.bottomItems,

            ),
          );
        },
      ),
    );
  }
}
