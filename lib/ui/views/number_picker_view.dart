import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:weddings_seats/util/themes.dart';

class NumberPickerView extends StatefulWidget {
  int minNumber;
  int maxNumber;
  int currentNumber;
  Function(num) onNumberChanged;

  NumberPickerView(
      this.minNumber, this.maxNumber, this.currentNumber, this.onNumberChanged);

  @override
  _NumberPickerViewState createState() => _NumberPickerViewState();

  void onValueChanged(num n) {
    onNumberChanged(n);
  }
}

class _NumberPickerViewState extends State<NumberPickerView> {
  @override
  Widget build(BuildContext context) {
    return NumberPicker.integer(
      initialValue: widget.currentNumber,
      minValue: 1,
      maxValue: widget.maxNumber,
      onChanged: (num n) {
        setState(() {
          widget.onNumberChanged(n);
          widget.currentNumber = n;
        });
      },
    );
  }
}
