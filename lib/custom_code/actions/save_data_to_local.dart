// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future saveDataToLocal(
  BuildContext context,
  String fieldName,
  String? saveData,
) async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(fieldName, saveData ?? '');
}
