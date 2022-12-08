import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetOrdersCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrders',
      apiUrl:
          'https://pickpackbackend.donaldharringto.repl.co/api/v1/shopify/get_orders',
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
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.msg''',
      );
  static dynamic ordersIDList(dynamic response) => getJsonField(
        response,
        r'''$.orders[:].id''',
        true,
      );
  static dynamic ordersCreatedList(dynamic response) => getJsonField(
        response,
        r'''$.orders[:].created_at''',
        true,
      );
  static dynamic ordersFulList(dynamic response) => getJsonField(
        response,
        r'''$.orders[:].fulfillment_status''',
        true,
      );
  static dynamic orders(dynamic response) => getJsonField(
        response,
        r'''$.orders''',
        true,
      );
}

class IsValidDomainCall {
  static Future<ApiCallResponse> call({
    String? domain = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'isValidDomain',
      apiUrl:
          'https://pickpackbackend.donaldharringto.repl.co/api/v1/auth/is_valid_domain',
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
      apiUrl:
          'https://pickpackbackend.donaldharringto.repl.co/api/v1/shopify/get_products_via_ids',
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
      apiUrl:
          'https://pickpackbackend.donaldharringto.repl.co/api/v1/shopify/is_customer',
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
      apiUrl:
          'https://pickpackbackend.donaldharringto.repl.co/api/v1/shopify/update_order_note',
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
