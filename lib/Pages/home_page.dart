// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:topics/Resources/strings_manager.dart';
import 'package:topics/Resources/styles_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(AppStrings.home,style: getSemiBoldStyle(color: Colors.black),),
      ),
    );
  }
}
