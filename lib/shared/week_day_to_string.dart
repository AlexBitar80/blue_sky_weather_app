import 'package:intl/intl.dart';

class StringFormatter {
  static String stringToDateTime(String date) {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
    return DateFormat('EEEE', 'pt_Br')
        .format(dateTime)
        .toString()
        .substring(0, 3);
  }

  static String hourFormatter(String hour) {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(hour);
    return DateFormat('HH:mm').format(dateTime);
  }
}
