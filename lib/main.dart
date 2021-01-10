import 'package:flutter/material.dart';
import 'package:par_demo/pages/detail_page.dart';
import 'package:par_demo/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        DetailPage.id: (context) => DetailPage(),
      },
    );
  }
}