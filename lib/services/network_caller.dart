import 'dart:convert';

import 'package:crafty_bay/models/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getResponse(
      {required final String url, required final String token}) async {
    try {
      final Uri serverAddress = Uri.parse(url);
      final Response response =
          await get(serverAddress, headers: {"token": token});
      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            responseCode: response.statusCode,
            responseBody: jsonDecode(response.body));
      } else {
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, responseCode: 404, errorMessage: e.toString());
    }
  }
}
