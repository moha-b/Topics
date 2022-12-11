import 'package:flutter/material.dart';
import 'package:topics/Pages/splash_page.dart';
import 'package:topics/Resources/strings_manager.dart';
import 'package:topics/pages/home_page.dart';

class Routes{
  static const String splash = "/";
  static const String home = "home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings){
    switch (settings.name) {
       case Routes.splash:
         return MaterialPageRoute(builder: (_) => const SplashPage());
       case Routes.home:
         return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body:const Center(child: Text(AppStrings.noRouteFound)),
        ));
  }
}