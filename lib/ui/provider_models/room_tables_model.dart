import 'package:flutter/material.dart';

class RoomTablesModel extends ChangeNotifier{
  final List<int> enabledCells;

  RoomTablesModel(this.enabledCells);

  List<int> getEnabledCellsIndexes() {
    return enabledCells.where((element) => element != -1).toList();
  }

  void onAllTableNumbersFilled() {
    notifyListeners();
  }
}
