import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class KeeperWorlds {
  List<String> worldsList = [];
  int letterLeft = 0;
}

class DataCubitWorlds extends Cubit<KeeperWorlds> {
  var rng = Random();

  List<String> get getWorlds => state.worldsList;

  int get getLetterLeft => state.letterLeft;

  setLettersLeft(int newValue) {
    state.letterLeft = newValue;
  }

  changeLettersLeft(int delta) {
    state.letterLeft = state.letterLeft + delta;
    print('changeLettersLeft: ${state.letterLeft}');
  }

  setWorldsList(List<String> newList) {
    state.worldsList = newList;
  }

  String getRandom() {
    if (!state.worldsList.isEmpty) {
      int index = rng.nextInt(state.worldsList.length);
      String strNextWorld = state.worldsList[index];
      state.worldsList.removeAt(index);
      return strNextWorld;
    }
    return '';
  }

  bool IsEmpty() {
    if (state.worldsList.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  removeWorld(int index) {
    state.worldsList.removeAt(index);
  }

  DataCubitWorlds(KeeperWorlds initState) : super(initState);
}
