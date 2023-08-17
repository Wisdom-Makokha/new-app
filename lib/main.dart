import 'package:flutter/material.dart';
import 'package:new_app/Screens/counter.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity:VisualDensity.adaptivePlatformDensity,
      ),
      home: const CounterScreen(),
    );
  }
}