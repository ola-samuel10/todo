import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void getDatePickerFunc(
  BuildContext context,
  Function(String date, DateTime raw) onDateSelected, {
  DateTime? firstTime,
  DateTime? lastDate,
  DateTime? initialDate,
  bool time = false,
}) async {
  if (Platform.isIOS) {
    var date = DateTime.now();
    // .subtract(
    //   const Duration(days: 1000),
    // );

    return _showDialog(
      context,
      child: CupertinoDatePicker(
        initialDateTime: initialDate ?? date,
        minimumDate: firstTime ?? date,
        maximumDate: lastDate ??
            date.add(
              const Duration(days: 20000),
            ),
        mode: time
            ? CupertinoDatePickerMode.dateAndTime
            : CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime newDate) {
          date = newDate;
          String dateTimeFormat = DateFormat.yMd().add_jms().format(newDate);
          String dateformat = DateFormat('dd-MM-yyyy').format(newDate);
          onDateSelected(time ? dateTimeFormat : dateformat, newDate);
        },
      ),
    );
  } else {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      // .subtract(
      //   const Duration(days: 1000),
      // ),
      firstDate: firstTime ?? DateTime(1880),
      lastDate: lastDate ??
          DateTime.now().add(
            const Duration(days: 2000),
          ),
    );

    if (selected != null) {
      if (time) {
        // ignore: use_build_context_synchronously
        TimeOfDay? selectedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );
        if (selectedTime != null) {
          String dateformat = DateFormat('dd-MM-yyyy').format(selected);
          onDateSelected(
            // ignore: use_build_context_synchronously
            "$dateformat ${selectedTime.format(context)}",
            selected,
          );
        }
      } else {
        String dateformat = DateFormat('dd-MM-yyyy').format(selected);
        onDateSelected(dateformat, selected);
      }
    }
  }
}

void _showDialog(BuildContext context, {required Widget child}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 266,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}
