import 'package:flutter/widgets.dart';

class InheritedListOfSeats extends InheritedWidget {
  const InheritedListOfSeats({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedListOfSeats of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedListOfSeats>();
  }

  @override
  bool updateShouldNotify(InheritedListOfSeats old) {
    return true;
  }
}
