import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetOrdersCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrders',
      apiUrl: '97.74.81.233:8001/api/v1/shopify/get_orders',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic orderCounts(dynamic response) => getJsonField(
        response,
        r'''$.count''',
      );
  static dynamic pickOrders(dynamic response) => getJsonField(
        response,
        r'''$.pick_orders''',
        true,
      );
  static dynamic packOrders(dynamic response) => getJsonField(
        response,
        r'''$.pack_orders''',
        true,
      );
  static dynamic pickCount(dynamic response) => getJsonField(
        response,
        r'''$.pick_count''',
      );
  static dynamic packCount(dynamic response) => getJsonField(
        response,
        r'''$.pack_count''',
      );
}

class IsValidDomainCall {
  static Future<ApiCallResponse> call({
    String? domain = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'isValidDomain',
      apiUrl: '97.74.81.233:8001/api/v1/auth/is_valid_domain',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'domain': domain,
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic isValidUrl(dynamic response) => getJsonField(
        response,
        r'''$.isValidUrl''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.shops.email''',
      );
}

class GetProductsByIdsCall {
  static Future<ApiCallResponse> call({
    String? ids = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductsByIds',
      apiUrl: '97.74.81.233:8001/api/v1/shopify/get_products_via_ids',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'ids': ids,
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      );
}

class IsCustomerCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'isCustomer',
      apiUrl: '97.74.81.233:8001/api/v1/shopify/is_customer',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.customer''',
      );
}

class UpdateOrderNoteCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? note = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'updateOrderNote',
      apiUrl: '97.74.81.233:8001/api/v1/shopify/update_order_note',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'note': note,
      },
      returnBody: true,
      cache: false,
    );
  }
}

class IsLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'isLogin',
      apiUrl: '97.74.81.233:8001/api/v1/auth/signin',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class AddUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? fullName = '',
  }) {
    final body = '''
{
  "full_name": "${fullName}",
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addUser',
      apiUrl: '97.74.81.233:8001/api/v1/auth/add_user',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.state''',
      );
}

class UpDateOrderTagCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? fullname = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'upDateOrderTag',
      apiUrl: '97.74.81.233:8001/api/v1/shopify/update_order_tags',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'fullname': fullname,
      },
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
