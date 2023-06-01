import 'package:flutter/material.dart';

Future<DateTime?> getDate({
  required BuildContext context,
  DateTime? initialDate,
}) async {
  DateTime? date =  await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1950, 1, 1),
    lastDate: DateTime.now(),
    helpText: "Select Birth Date",
  );

  return date;
}
