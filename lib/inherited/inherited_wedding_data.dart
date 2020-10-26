import 'package:flutter/widgets.dart';

class InheritedWeddingData extends InheritedWidget {
  const InheritedWeddingData({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedWeddingData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWeddingData>();
  }

  @override
  bool updateShouldNotify(InheritedWeddingData old) {
    return true;
  }
}
