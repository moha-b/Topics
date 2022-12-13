// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset("assets/images/firebase.png",width: 200,height: 200,),
              Text(user!.email!),
              ElevatedButton(onPressed: ()=> FirebaseAuth.instance.signOut(),
                  style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)),
                  child: Text("Sign Out"))
            ],
          ),
        ),
      ),
    );
  }
}
