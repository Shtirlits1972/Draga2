import 'package:draga_2/worlds_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TargetWidget extends StatefulWidget {
  TargetWidget({Key? key, required this.currString}) : super(key: key);
  String currString = '';
  @override
  _TargetWidgetState createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  String emptyStr = '-';
  @override
  Widget build(BuildContext context) {
    return Container(child:
        BlocBuilder<DataCubitWorlds, KeeperWorlds>(builder: (context, state) {
      return DragTarget<String>(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            height: 50.0,
            width: 50.0,
            color: Colors.amberAccent,
            child: Center(
              child: Text(
                emptyStr,
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          );
        },
        onWillAccept: (data) {
          if (data == widget.currString) {
            print('return true');
            return true;
          } else {
            print('return false');
            return false;
          }
        },
        onAccept: (String data) {
          print('data: $data');
          setState(() {
            context.read<DataCubitWorlds>().changeLettersLeft(-1);
            emptyStr = data;
          });
        },
      );
    }));
  }
}
