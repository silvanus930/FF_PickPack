import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<dynamic> sortOrderList(List<dynamic> originList) {
  originList.sort((a, b) => a['created_at'].compareTo(b['created_at']));
  return originList;
}

List<dynamic> sortOrderListWidtIndex(
  List<dynamic> originList,
  bool isSort,
  String searchString,
) {
  List<dynamic> result = [];

  if (!searchString.isEmpty)
    for (var val in originList) {
      String str = val['name'].toLowerCase();
      if (str.contains(searchString.toLowerCase())) {
        result.add(val);
      }
    }
  else
    result = originList;

  if (isSort) {
    result.sort((a, b) => a['created_at'].compareTo(b['created_at']));
  }
  return result;
}

List<dynamic> getPickListWithSearchIndex(
  List<dynamic> pickList,
  String searchString,
) {
  List<dynamic> result = [];

  for (var val in pickList) {
    if (val['title'].toLowerCase().contains(searchString.toLowerCase())) {
      result.add(val);
    }
  }

  result.sort((a, b) => a['title'].compareTo(b['title']));

  return result;
}

List<dynamic> getOrderListHasNote(List<dynamic> originList) {
  List<dynamic> result = [];
  for (var val in originList) {
    if (val['note'] != "") result.add(val);
  }
  return result;
}

List<dynamic> getOrderListWithName(
  List<dynamic> originList,
  String searchName,
) {
  List<dynamic> result = [];
  for (var val in originList) {
    if (val['customer']['first_name'].contains(searchName) ||
        val['customer']['last_name'].contains(searchName)) {
      result.add(val);
    }
  }
  return result;
}

String stringToDate(String? originDate) {
  // string date to fomated date
  DateTime dateTime = DateTime.parse(originDate.toString());

  final DateFormat df = DateFormat('yyyy-MM-dd');

  return df.format(dateTime);
}

String getDomainFromStoreName(String storeName) {
  var domain = '.myshopify.com';
  return (storeName + domain);
}

List<dynamic> initOrderListSelection(List<dynamic> orderList) {
  for (var val in orderList) {
    val['fulfillment_status'] = false;
  }
  return orderList;
}

List<dynamic> setOrderFlagWithID(
  List<dynamic> orderList,
  String? oderId,
) {
  List<dynamic> result = [];
  for (var val in orderList) {
    if (val['name'] == oderId) {
      if (val['fulfillment_status'] == null ||
          val['fulfillment_status'] == false) {
        val['fulfillment_status'] = true;
      } else {
        val['fulfillment_status'] = false;
      }
    }
    result.add(val);
  }
  return result;
}

bool getOrderFlagWithID(
  List<dynamic> orderList,
  String? oderId,
) {
  for (var val in orderList) {
    if (val['name'] == oderId) {
      if (val['fulfillment_status'] == true) {
        return true;
      }
    }
  }
  return false;
}

String getProductIDs(List<dynamic> orderList) {
  List<String> result = [];
  for (var val in orderList) {
    if (val['fulfillment_status'] == true) {
      for (var v in val['line_items']) {
        result.add(v['product_id'].toString());
      }
    }
  }
  return result.join(',');
}

String getProductListFromOrder(dynamic order) {
  List<String> result = [];
  for (var val in order['line_items']) {
    result.add(val['product_id'].toString());
  }
  return result.join(',');
}

int getProductNumberByID(
  List<dynamic> productList,
  int? id,
) {
  // Add your function code here!
  for (var val in productList) {
    if (val['id'] == id) return val['variants'][0]['position'];
  }
  return 1;
}

List<dynamic> decreaseProductNumberById(
  List<dynamic> productList,
  int? id,
) {
  // Add your function code here!
  List<dynamic> result = [];
  for (var val in productList) {
    if (val['id'] == id) {
      if (val['variants'][0]['position'] > 0) {
        val['variants'][0]['position'] -= 1;
      }
    }
    result.add(val);
  }
  return result;
}

int getPickedNumberFromPickList(List<dynamic> pickList) {
  num result = 0;
  for (var val in pickList) {
    result += val['variants'][0]['position'];
  }
  return result.toInt();
}

List<dynamic> getSelectedOrderList(List<dynamic> orderList) {
  List<dynamic> result = [];
  for (var val in orderList) {
    if (val['fulfillment_status'] == true) {
      result.add(val);
    }
  }
  return result;
}

String getFullName(
  String firstName,
  String lastName,
) {
  // Add your function code here!
  return firstName + ' ' + lastName;
}

List<dynamic> updateSelectedOrderNote(
  List<dynamic> orderList,
  int? orderID,
  String? note,
) {
  List<dynamic> result = [];
  for (var val in orderList) {
    if (val['id'] == orderID) {
      val['note'] = note;
    }
    result.add(val);
  }
  return result;
}

bool isNoteEmpty(String? note) {
  if (note == 'null' || note == '') return false;
  return true;
}

bool isTagEmpty(String? tag) {
  if (tag == 'null' || tag == '') return false;
  return true;
}

String getButtonString(
  bool isPick,
  int number,
) {
  if (isPick) return 'To Pick (' + number.toString() + ')';
  return 'Packed (' + number.toString() + ')';
}

List<String>? spiltTagToTags(String? tagString) {
  if (tagString == '' || tagString == 'null') return [];
  return tagString!.split(',');
}
