import 'package:intl/intl.dart';

class Constand {
  static DateTime now = DateTime.now();
  static String formattedDate = DateFormat("yyyy-MM-dd").format(now);
  static String formattedDate2 = DateFormat("dd-MM-yyyy").format(now);
  static List<String> splitString = formattedDate.split("-");
  static String concract =
      "PH" + splitString[0].substring(2, 4) + splitString[1] + splitString[2];
}
