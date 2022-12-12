// ignore_for_file: prefer_const_constructors

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  //final Future _fb = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Sing in"),
      ),
      body: Center(
        child: Text("Hi"),
      ),
    );
  }
}
