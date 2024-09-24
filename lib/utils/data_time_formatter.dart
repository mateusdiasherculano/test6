import 'package:easy_localization/easy_localization.dart';

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat('MM/dd/yyyy HH:mm');
  return formatter.format(dateTime.toLocal());
}
