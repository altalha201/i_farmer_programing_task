import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../core/config/configs.dart';
import '../../../core/constants/api_params.dart';
import 'api_source.dart';

class ApiImpl implements ApiSource {
  static const String _kTag = "ApiSource";

  final _authority = "www.omdbapi.com";
  final _endPoint = "";
  final _timeOutDuration = const Duration(seconds: 15);

  @override
  Future<Map<String, dynamic>> getResponseFromOMDb(Map<String, dynamic> params) async {
    urlLogger("$_authority$_endPoint", params);
    try {
      params[ApiParams.kApiKey] = SecretsConfig.kApiKey;
      final url = Uri.https(_authority, _endPoint, params);
      final response = await http.get(url).timeout(_timeOutDuration);
      dataLogger(_kTag, jsonDecode(response.body));
      if (response.statusCode == 200) {
        return _handelSuccessResponse(response.body);
      } else {
        throw FetchDataException();
      }
    } on TimeoutException catch (_) {
      throw TimeExpiredException();
    } on SocketException catch (_) {
      throw FetchDataException(message: "No Internet Connection");
    } catch (_) {
      rethrow;
    }
  }

  Map<String, dynamic> _handelSuccessResponse(String body) {
    final bodyJson = jsonDecode(body);
    final success = bool.parse(bodyJson["Response"].toString().toLowerCase());
    if (success) {
      return bodyJson;
    } else {
      throw NotFoundException();
    }
  }
}