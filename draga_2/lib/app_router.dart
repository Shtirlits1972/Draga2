import 'package:draga_2/pages/second_page.dart';
import 'package:draga_2/pages/start_page.dart';
import 'package:draga_2/worlds_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  int selectIndex = 0;
  final DataCubitWorlds cubitWorlds = DataCubitWorlds(KeeperWorlds());

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cubitWorlds,
            child: StartPage(),
          ),
        );

      case '/SecondPage':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cubitWorlds,
            child: SecondPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cubitWorlds,
            child: StartPage(),
          ),
        );
    }
  }
}
