import 'package:intl/intl.dart';

class CommonUtils{

  static String formatDateDayMonth(String dateToFormat) {
    return DateFormat("dd MMM")
        .format(DateFormat("dd MMMM yyyy").parse(dateToFormat));
  }

  static String formatDateWithDayName(String dateToFormat) {
    return DateFormat("EEEE, MMMM dd, yyyy")
        .format(DateFormat("dd MMMM yyyy").parse(dateToFormat));
  }

}