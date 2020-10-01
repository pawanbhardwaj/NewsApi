import 'dart:convert';

import 'package:NewsApi/description.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Quicksand",
          appBarTheme: AppBarTheme(
              centerTitle: true,
              textTheme: TextTheme(title: TextStyle(fontFamily: "Josefin")))),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

Future<Map<String, dynamic>> getNews() async {
  String url =
      "http://newsapi.org/v2/everything?q=cricket&sortBy=publishedAt&apiKey=cf413c1dcd814c3eac5859fa3d39869a";
  var res = await http.get(url);
  return json.decode(res.body);
}
