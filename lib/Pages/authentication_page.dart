// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:topics/Pages/sing_in_page.dart';
import 'package:topics/Pages/sing_up_page.dart';


class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? SignInPage(onClicked: toggle)
        : SignUpPage(onClicked: toggle);
  }
  void toggle() => setState(() {isLogin = !isLogin;});
}
