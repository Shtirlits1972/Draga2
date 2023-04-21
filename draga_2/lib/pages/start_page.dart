import 'package:draga_2/constants.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
      ),
    );
  }
}
