// ignore_for_file: file_names, unused_catch_stack

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  static Future<void> saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  static Future<String> getFromPreferences(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return Future<String>.value(prefs.getString(key) ?? '');
    } catch (e, st) {
      debugPrint(e.toString());
      return '';
    }
  }

  static Future<void> removePreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}