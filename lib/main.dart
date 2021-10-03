import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebooktask/config/palette.dart';
import 'package:flutter_facebooktask/screens/nav_screen.dart';



void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
           // ignore: prefer_const_constructors
           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarBrightness:Brightness.light,
             statusBarColor: Colors.white,
             
             statusBarIconBrightness: Brightness.dark,
           )
        ),
        scaffoldBackgroundColor: Palette.scaffold
      ),
      home: NavScreen(),

    );
  }
}

