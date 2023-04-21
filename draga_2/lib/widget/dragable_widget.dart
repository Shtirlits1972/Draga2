import 'package:flutter/material.dart';

class DragableWidget extends StatefulWidget {
  DragableWidget({Key? key, required this.currString}) : super(key: key);
  String currString = '';
  @override
  _DragableWidgetState createState() => _DragableWidgetState();
}

class _DragableWidgetState extends State<DragableWidget> {
  String tempString = '';
  Color dragColor = Colors.blueAccent;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Draggable<String>(
        data: widget.currString,
        //   axis: Axis.horizontal,
        feedback: Container(
          height: 50.0,
          width: 50.0,
          color: dragColor,
          child: Center(
            child: Text(
              tempString,
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
        onDragEnd: (details) {
          if (details.wasAccepted) {
            setState(() {
              tempString = '';
              dragColor = Colors.transparent;
            });
          }
        },
        child: Container(
          height: 50.0,
          width: 50.0,
          color: dragColor,
          child: Center(
            child: Text(
              tempString,
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    tempString = widget.currString;
    super.initState();
  }
}
