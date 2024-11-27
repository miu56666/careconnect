// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String getAgeFromDate(DateTime birthDate) {
  // MODIFY CODE ONLY BELOW THIS LINE

  DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // Adjust months and years if necessary
  if (days < 0) {
    months -= 1;
    days += DateTime(today.year, today.month, 0).day;
  }
  if (months < 0) {
    years -= 1;
    months += 12;
  }

  if (years >= 1) {
    return '$years years';
  } else {
    return '$months months $days days';
  }

  // MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
