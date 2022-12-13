// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  late String _name,_emil,_password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Sing Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(label: Text("username")),
                onChanged: (value) {
                  _name = value;
                },
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(label: Text("E-mail")),
                onChanged: (value) {
                  _emil = value;
                },
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(label: Text("password")),
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(onPressed: (){}, child: Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
