// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:topics/Pages/sing_in_page.dart';
import 'package:topics/Pages/sing_up_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SingInPage(),));
            }, child: Text("Sing in")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SingUpPage(),));
            }, child: Text("Sing up")),
          ],
        ),
      ),
    );
  }
}
