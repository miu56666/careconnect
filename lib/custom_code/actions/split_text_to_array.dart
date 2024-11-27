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

Future<List<String>> splitTextToArray(String inputText) async {
  // Add your function code here!
  // Ensure inputText is not empty
  if (inputText.trim().isEmpty) {
    return [];
  }

  // Split the text using a space as the delimiter
  final splitArray = inputText.split(' ');

  // Return the resulting array
  return splitArray;
}
