import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/module/details_screen.dart';

Widget buildArticleItem(article) => Padding(
  padding: const EdgeInsets.all(18.0),
  child: Row(
    children: [
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:  DecorationImage(
              image: NetworkImage("${article['urlToImage']}"),
              fit: BoxFit.cover
          ),
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Container(
          height: 120,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Expanded(
                child: Text(
                  '${article['title']}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: const TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        ),
      ),
    ],
  ),
);
Widget ItemDivider() =>  Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],

) ;

Widget articleBuilder(list)=>ConditionalBuilder(
  condition:  list.isNotEmpty ,
  builder: (context)=> ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index) => GestureDetector(child: buildArticleItem(list[index]),onTap:(){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(article: list[index],),));
        navigateTo(context, DetailsScreen(article: list[index]));
        print('pressed');
      },),
      separatorBuilder:(context,index)=> ItemDivider(),
      itemCount: 10),
  fallback:(context)=> Center(child: CircularProgressIndicator(color: Colors.lightGreen,)) ,


);
Widget articleDetails(article)=>Container(child: Text(article),);

void navigateTo(context,widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}