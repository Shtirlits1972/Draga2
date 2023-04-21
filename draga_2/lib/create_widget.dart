import 'dart:math';

import 'package:draga_2/widget/dragable_widget.dart';
import 'package:draga_2/widget/target_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateWidget {
  static getColumn(String inputString, BuildContext context) {
    List<TargetWidget> listTarget = [];
    List<DragableWidget> listDragable = [];

    List<String> mixed = [];
    List<int> indexWorld = [];

    var rng = Random();

    try {
      while (mixed.length < inputString.length) {
        int int1 = rng.nextInt(inputString.length);
        if (!indexWorld.contains(int1)) {
          indexWorld.add(int1);
          mixed.add(inputString[int1]);
          int h = 0;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    print(mixed);

    for (int i = 0; i < inputString.length; i++) {
      listTarget.add(TargetWidget(
        currString: inputString[i],
      ));

      listDragable.add(DragableWidget(
        currString: mixed[i],
      ));
    }

    Row rowTarget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listTarget,
    );
    Row rowDrag = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listDragable,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [rowTarget, rowDrag],
    );
  }
}
