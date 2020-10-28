import 'package:flutter/widgets.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';

class InheritedWeddingData extends InheritedWidget {
  const InheritedWeddingData(
    this.weddingSeatsBloc, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedWeddingData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWeddingData>();
  }

  final WeddingSeatsBloc weddingSeatsBloc;

  @override
  bool updateShouldNotify(InheritedWeddingData old) {
    return true;
  }
}
