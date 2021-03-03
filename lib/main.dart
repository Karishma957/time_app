import 'package:flutter/material.dart';
import './pages/loading.dart';
import './pages/home.dart';
import './pages/choose location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context)=>LoadingScreen(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
  ));
}
