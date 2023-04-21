import 'package:draga_2/constants.dart';
import 'package:draga_2/create_widget.dart';
import 'package:draga_2/worlds_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Widget w;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'MyApp',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body:
          BlocBuilder<DataCubitWorlds, KeeperWorlds>(builder: (context, state) {
        return Center(child: w);
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/SecondPage',
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: 5.0, right: 20.0, bottom: 5.0),
                child: Text(
                  'SKIP',
                  style: txt15,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              Navigator.pushNamed(
                context,
                '/',
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: 5.0, right: 20.0, bottom: 5.0),
                child: Text(
                  'RESET',
                  style: txt15,
                ),
              ),
            ),
          ),
          TextButton(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: 5.0, right: 20.0, bottom: 5.0),
                child: Text(
                  'NEXT',
                  style: txt15,
                ),
              ),
            ),
            onPressed: () {
              print(
                  'getLetterLeft: ${context.read<DataCubitWorlds>().getLetterLeft}');
              if (context.read<DataCubitWorlds>().getLetterLeft > 0) {
                final snackBar = SnackBar(
                  content: const Text('You have to guess all the letters!'),
                  backgroundColor: (Colors.black12),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      print('The End');
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                if (!context.read<DataCubitWorlds>().IsEmpty()) {
                  Navigator.pushNamed(
                    context,
                    '/SecondPage',
                  );
                } else {
                  final snackBar = SnackBar(
                    content: const Text('You WIN!'),
                    backgroundColor: (Colors.black12),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        print('The End');
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    setState(() {
      String strRandom = context.read<DataCubitWorlds>().getRandom();
      w = CreateWidget.getColumn(strRandom, context);
      context.read<DataCubitWorlds>().setLettersLeft(strRandom.length);
    });
    super.initState();
  }
}
