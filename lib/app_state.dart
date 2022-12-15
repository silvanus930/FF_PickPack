import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
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

  bool _isEmail = false;
  bool get isEmail => _isEmail;
  set isEmail(bool _value) {
    notifyListeners();

    _isEmail = _value;
  }

  int _pickNumber = 1;
  int get pickNumber => _pickNumber;
  set pickNumber(int _value) {
    notifyListeners();

    _pickNumber = _value;
  }

  String _storeName = '';
  String get storeName => _storeName;
  set storeName(String _value) {
    notifyListeners();

    _storeName = _value;
  }

  bool _isSorting = false;
  bool get isSorting => _isSorting;
  set isSorting(bool _value) {
    notifyListeners();

    _isSorting = _value;
  }

  bool _isShowNote = false;
  bool get isShowNote => _isShowNote;
  set isShowNote(bool _value) {
    notifyListeners();

    _isShowNote = _value;
  }

  List<dynamic> _orderList = [];
  List<dynamic> get orderList => _orderList;
  set orderList(List<dynamic> _value) {
    notifyListeners();

    _orderList = _value;
  }

  void addToOrderList(dynamic _value) {
    notifyListeners();
    _orderList.add(_value);
  }

  void removeFromOrderList(dynamic _value) {
    notifyListeners();
    _orderList.remove(_value);
  }

  String _searchString = '';
  String get searchString => _searchString;
  set searchString(String _value) {
    notifyListeners();

    _searchString = _value;
  }

  dynamic _ownerInfo;
  dynamic get ownerInfo => _ownerInfo;
  set ownerInfo(dynamic _value) {
    notifyListeners();

    _ownerInfo = _value;
  }

  List<dynamic> _pickList = [];
  List<dynamic> get pickList => _pickList;
  set pickList(List<dynamic> _value) {
    notifyListeners();

    _pickList = _value;
  }

  void addToPickList(dynamic _value) {
    notifyListeners();
    _pickList.add(_value);
  }

  void removeFromPickList(dynamic _value) {
    notifyListeners();
    _pickList.remove(_value);
  }

  String _pickSearchString = '';
  String get pickSearchString => _pickSearchString;
  set pickSearchString(String _value) {
    notifyListeners();

    _pickSearchString = _value;
  }

  bool _showBeginPacking = false;
  bool get showBeginPacking => _showBeginPacking;
  set showBeginPacking(bool _value) {
    notifyListeners();

    _showBeginPacking = _value;
  }

  int _totalPickNumber = 0;
  int get totalPickNumber => _totalPickNumber;
  set totalPickNumber(int _value) {
    notifyListeners();

    _totalPickNumber = _value;
  }

  int _totalPackNumber = 0;
  int get totalPackNumber => _totalPackNumber;
  set totalPackNumber(int _value) {
    notifyListeners();

    _totalPackNumber = _value;
  }

  List<dynamic> _orderPickList = [];
  List<dynamic> get orderPickList => _orderPickList;
  set orderPickList(List<dynamic> _value) {
    notifyListeners();

    _orderPickList = _value;
  }

  void addToOrderPickList(dynamic _value) {
    notifyListeners();
    _orderPickList.add(_value);
  }

  void removeFromOrderPickList(dynamic _value) {
    notifyListeners();
    _orderPickList.remove(_value);
  }

  List<dynamic> _orderPackList = [];
  List<dynamic> get orderPackList => _orderPackList;
  set orderPackList(List<dynamic> _value) {
    notifyListeners();

    _orderPackList = _value;
  }

  void addToOrderPackList(dynamic _value) {
    notifyListeners();
    _orderPackList.add(_value);
  }

  void removeFromOrderPackList(dynamic _value) {
    notifyListeners();
    _orderPackList.remove(_value);
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String _value) {
    notifyListeners();

    _userEmail = _value;
  }

  String _userPassword = '';
  String get userPassword => _userPassword;
  set userPassword(String _value) {
    notifyListeners();

    _userPassword = _value;
  }

  String _searchStringPack = '';
  String get searchStringPack => _searchStringPack;
  set searchStringPack(String _value) {
    notifyListeners();

    _searchStringPack = _value;
  }

  String _fullName = '';
  String get fullName => _fullName;
  set fullName(String _value) {
    notifyListeners();

    _fullName = _value;
  }
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
