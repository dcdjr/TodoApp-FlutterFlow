import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _quoteText = prefs.getString('ff_quoteText') ?? _quoteText;
    });
    _safeInit(() {
      _quoteAuthorText =
          prefs.getString('ff_quoteAuthorText') ?? _quoteAuthorText;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _quoteText = '';
  String get quoteText => _quoteText;
  set quoteText(String value) {
    _quoteText = value;
    prefs.setString('ff_quoteText', value);
  }

  String _quoteAuthorText = '';
  String get quoteAuthorText => _quoteAuthorText;
  set quoteAuthorText(String value) {
    _quoteAuthorText = value;
    prefs.setString('ff_quoteAuthorText', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
