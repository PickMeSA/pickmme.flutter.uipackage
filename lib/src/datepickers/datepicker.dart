import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/extensions/date.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({
    super.key,
    this.restorationId,
    this.initialDate,
    this.onDateSelected,
  });

  final String? restorationId;
  final DateTime? initialDate;
  final void Function(DateTime selectedDate)? onDateSelected;

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _AppDatePickerState extends State<AppDatePicker>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  late final RestorableDateTime _selectedDate;
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );
  @override
  void initState() {
    _selectedDate = RestorableDateTime(widget.initialDate??DateTime.now());
    super.initState();
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now().addYears(numberOfYears: -100),
          lastDate: DateTime.now().addYears(numberOfYears: 100),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      if(widget.onDateSelected != null){
        widget.onDateSelected!.call(newSelectedDate);
      }
      setState(() {
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(const Color(0xFF111828)),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          // minimumSize: MaterialStateProperty.all(const Size(50, 30)),
          tapTargetSize: MaterialTapTargetSize.padded,
          alignment: Alignment.center
      ),
      onPressed: () {
        _restorableDatePickerRouteFuture.present();
      },
      child: const Icon(Icons.calendar_month_rounded,),
    );
  }
}
