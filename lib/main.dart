// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:topics/Pages/home_page.dart';

import 'Pages/sing_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firebase"),
          backgroundColor: Colors.amber,
        ),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child:CircularProgressIndicator(
                  color: Colors.amber,
                ),);
              } else if(snapshot.hasError) {
                return Center(child: Text("Something went wrong!"),);
              }else if(snapshot.hasData){
                return HomePage();
              } else{
                return SignInPage();
              }
            }),
      ),
    );
  }
}
