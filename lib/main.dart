import 'package:flutter/material.dart';
import 'package:topics/Pages/splash_page.dart';
import 'package:topics/Resources/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.getRoute,
      home: SplashPage(),
    );
  }
}
