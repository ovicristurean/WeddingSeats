import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/views/room_setup_view.dart';

class InheritedConfigurableTableLayout extends InheritedWidget {
  const InheritedConfigurableTableLayout(
    this.roomSetupView, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedConfigurableTableLayout of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedConfigurableTableLayout>();
  }

  final RoomSetupView roomSetupView;

  @override
  bool updateShouldNotify(InheritedConfigurableTableLayout old) {
    return true;
  }
}
