import 'package:intl/intl.dart';

String formatDisplayDate(DateTime date) {
  return DateFormat('EEEE, d MMMM').format(date);
}
