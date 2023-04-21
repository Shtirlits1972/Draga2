import 'package:draga_2/pages/second_page.dart';
import 'package:draga_2/pages/start_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  int selectIndex = 0;

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const StartPage(),
        );

      case '/SecondPage':
        return MaterialPageRoute(
          builder: (context) => const SecondPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const StartPage(),
        );
    }
  }
}
