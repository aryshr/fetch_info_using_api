
import 'package:fetch_info_using_api/info_view.dart';
import 'package:fetch_info_using_api/input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      'input':(context)=>Input(),
      'info_view':(context)=>Info()
    },
    initialRoute: 'input',
  ));
}

