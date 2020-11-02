import 'package:flutter/cupertino.dart';

class InheritedRoomTableNumbers extends InheritedWidget {
  const InheritedRoomTableNumbers(
    this.enabledCells,
    this.tableNumbers,
    this.showSnackbar, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedRoomTableNumbers of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedRoomTableNumbers>();
  }

  final List<bool> enabledCells;
  final List<int> tableNumbers;
  final Function(String) showSnackbar;

  @override
  bool updateShouldNotify(InheritedRoomTableNumbers old) => true;
}
