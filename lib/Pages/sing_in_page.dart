// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late String _emil,_password;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/firebase.png",width: 200,height: 200,),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(label: Text("E-mail",style: TextStyle(color: Colors.amber)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),),),
              onChanged: (value) {
                _emil = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (value){
                _password = value;
              },
              decoration: InputDecoration(label: Text("password",style: TextStyle(color: Colors.amber),),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),),),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              child: ElevatedButton(onPressed: signIn,
              style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)),
                child: Text("Login"),),
            )
          ],
        ),
      ),
    );
  }

  Future signIn() async{
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: _emil,
         password: _password
     );
   }on FirebaseAuthException catch(e){
      print(e);
   }
  }
}
