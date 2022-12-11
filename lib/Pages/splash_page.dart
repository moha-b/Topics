import 'package:flutter/material.dart';
import 'package:topics/Resources/routes_manager.dart';

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
        }, child: const Text("Splash Page")),
      ),
    );
  }
}
