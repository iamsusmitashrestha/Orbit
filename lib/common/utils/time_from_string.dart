import 'package:flutter/material.dart';

TimeOfDay timeFromString(String time) {
  List<String> partsBySpace = time.split(' ');
  String time12 = partsBySpace[0];
  String a = partsBySpace[1];

  List<String> partsByColon = time12.split(':');
  int hour = int.parse(partsByColon[0]);
  int minute = int.parse(partsByColon[1]);

  if ((a == "PM" && time12 != "12") || (a == "AM" && time12 == "12")) {
    hour = hour + 12;
    hour = hour % 24;
  }
  return TimeOfDay(hour: hour, minute: minute);
}
