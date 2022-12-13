// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClicked;
  const SignUpPage({required this.onClicked, Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _name, _emil, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 30
            ),
            Image.asset(
              "assets/images/firebase.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20
            ),
            TextField(
              decoration: InputDecoration(label: Text("E-mail"),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),),
              onChanged: (value) {
                _emil = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(label: Text("password"),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),),
              onChanged: (value) {
                _password = value;
              },
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed: signUp,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.amber)),
                  child: Text("Sign Up")),
            ),
            TextButton(onPressed: widget.onClicked, child: Text("Sign In!")),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: _emil,
          password: _password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
