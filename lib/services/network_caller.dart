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

  static Future<NetworkResponse> postResponse(
      {required final String url,
      required final String token,
      required final Map<String, dynamic> dataToPost}) async {
    try {
      final Uri serverAddress = Uri.parse(url);
      final Response serverResponse = await post(serverAddress,
          headers: {"token": token, "content-type": "application/jason"},
          body: json.encode(dataToPost));

      if (serverResponse.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            responseCode: 200,
            responseBody: json.decode(serverResponse.body));
      } else {
        return NetworkResponse(
            isSuccess: false, responseCode: serverResponse.statusCode);
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, responseCode: 404, errorMessage: e.toString());
    }
  }
}
