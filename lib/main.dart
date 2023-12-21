import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/layout/news_layout.dart';
import 'package:newsapp/network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.lightGreen
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey,
          iconTheme: IconThemeData(
            color: Colors.lightGreen
          ),

        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.lightGreen,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: HexColor('333739'),
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blueGrey,
            selectedItemColor: Colors.lightGreen,

        ),
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey,
          iconTheme: IconThemeData(
              color: Colors.lightGreen
          ),

        ),

      ),
      themeMode: ThemeMode.light,
      home:  NewsApp(),
    );
  }
}

