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

import 'package:intl/intl.dart';

String getDayName(DateTime selectedDate) {
  // Format the selected date to get the full day name in English
  String dayName = DateFormat('EEEE', 'en_US').format(selectedDate);
  // Return the day name with first letter capitalized
  return dayName; // Already returns like "Thursday" by default
}
