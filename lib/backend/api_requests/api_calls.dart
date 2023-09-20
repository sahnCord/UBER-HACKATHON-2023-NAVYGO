import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeocodingCall {
  static Future<ApiCallResponse> call({
    String? address = '35700068, Sete Lagoas',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Geocoding',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?language=\tpt-BR&key=AIzaSyBnD3_VgMGqtcaR-_7oZnwUYJKqCN3rBNQ&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'language': "en-US",
        'key': "AIzaSyBnD3_VgMGqtcaR-_7oZnwUYJKqCN3rBNQ",
        'address': address,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
