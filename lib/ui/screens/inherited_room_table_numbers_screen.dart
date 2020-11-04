import 'package:flutter/cupertino.dart';

class InheritedRoomTableNumbers extends InheritedWidget {
  const InheritedRoomTableNumbers(
    this.enabledCells,
    this.onAllTableNumbersFilled, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedRoomTableNumbers of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedRoomTableNumbers>();
  }

  final List<int> enabledCells;
  final VoidCallback onAllTableNumbersFilled;

  List<int> getEnabledCellsIndexes() {
    return enabledCells.where((element) => element != -1).toList();
  }

  @override
  bool updateShouldNotify(InheritedRoomTableNumbers old) => true;
}
