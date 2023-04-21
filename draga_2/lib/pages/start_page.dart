import 'package:draga_2/constants.dart';
import 'package:draga_2/worlds_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          BlocBuilder<DataCubitWorlds, KeeperWorlds>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'MyApp',
              style: TextStyle(fontSize: 30),
            ),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/SecondPage',
                );
              },
              child: Text(
                'GO',
                style: txt30,
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    context.read<DataCubitWorlds>().setWorldsList(worlds);
    super.initState();
  }
}
