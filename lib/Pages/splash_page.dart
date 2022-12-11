import 'package:flutter/material.dart';
import 'package:topics/Resources/routes_manager.dart';
import 'package:topics/Resources/strings_manager.dart';
import 'package:topics/Resources/styles_manager.dart';

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
        child: ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, Routes.home);
        }, child: Text(AppStrings.splash,style: getBoldStyle(color: Colors.white,fontSize: 40),)),
      ),
    );
  }
}
