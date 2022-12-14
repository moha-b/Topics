// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:topics/database/database.dart';
import 'package:topics/model/dog.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<Dog> list = List.empty();
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future getData() async {
    list = await AppDatabase.instance.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
