import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  bool isEmail = false;

  int pickNumber = 1;

  String storeName = '';

  bool isSorting = false;

  bool isShowNote = false;

  List<dynamic> orderList = [];

  String searchString = '';

  dynamic ownerInfo;

  List<dynamic> pickList = [];

  String pickSearchString = '';

  bool showBeginPacking = false;

  int totalPickNumber = 0;

  int totalPackNumber = 0;
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
