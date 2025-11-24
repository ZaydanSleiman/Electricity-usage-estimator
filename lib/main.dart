//Zaydan Sleiman 32230485
//Yorgo Hanna 32230998


import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electricity Estimator',
      home: Home(),
    );
  }
}
