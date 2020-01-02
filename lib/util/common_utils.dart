import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonUtils {
  static String formatDateDayMonth(String dateToFormat) {
    return DateFormat("dd MMM")
        .format(DateFormat("dd MMMM yyyy").parse(dateToFormat));
  }

  static String formatDateWithDayName(String dateToFormat) {
    return DateFormat("EEEE, MMMM dd, yyyy")
        .format(DateFormat("dd MMMM yyyy").parse(dateToFormat));
  }

  static String formatDateForServer(String dateToFormat) {
    return DateFormat("yyyy")
        .format(DateFormat("yyyy").parse(dateToFormat));
  }
  static String formatMonthForServer(String dateToFormat) {
    return DateFormat("MM")
        .format(DateFormat("MM").parse(dateToFormat));
  }

  static fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
