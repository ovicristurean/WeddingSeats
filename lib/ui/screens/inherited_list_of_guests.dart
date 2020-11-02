import 'package:flutter/widgets.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';

class InheritedListOfGuests extends InheritedWidget {
  const InheritedListOfGuests(
    this.onPageChanged, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedListOfGuests of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedListOfGuests>();
  }

  final Function(GuestStatus) onPageChanged;

  @override
  bool updateShouldNotify(InheritedListOfGuests old) {
    return true;
  }
}