import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  var searchControl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context,states){} ,
      builder: (context,states){
        var list=NewsCubit.get(context).searchData;
        return Scaffold(
          appBar:AppBar(),
          body: Column(
            children: [
              TextFormField(
                controller:searchControl ,
                onChanged: (value){
                  print(value);
                  NewsCubit.get(context).getSearchData(value);
                },
              ),
              SizedBox(height: 20,),
              // articleBuilder(list),

            ],
          ),
        );
      },
    );
  }
}
