import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/screens/bottom_items_wrapper.dart';

class InheritedMainScreen extends InheritedWidget {
  const InheritedMainScreen(
    this.onPageChanged,
    this.onTitleChanged, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final Function(BottomItemType) onPageChanged;
  final Function(String) onTitleChanged;

  static InheritedMainScreen of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedMainScreen>();
  }

  @override
  bool updateShouldNotify(InheritedMainScreen old) => true;
}
