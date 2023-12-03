// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'package:get/get.dart';
import 'package:sdg_hackaton_app/models/error_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService {
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  String? token;
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
    //  "Authorization": "Bearer $accessToken"
  };

  ApiService() {
    setToken();
  }

  Future<void> setToken({String? value}) async {
    if (value == null || value == "") {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
    } else {
      token = token;
    }
    requestHeaders.addAll({"Authorization": "Bearer $requestHeaders"});
  }

  Future<Response> getData(String url,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $url\nHeader: $requestHeaders',
          wrapWidth: 1024);

      http.Response response = await http
          .get(
            Uri.parse(url),
            headers: headers ?? requestHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, url);
    } catch (e) {
      debugPrint('------------${e.toString()}', wrapWidth: 1024);
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String url, dynamic body,
      {Map<String, String>? headers, int? timeout}) async {
    try {
      debugPrint('====> API Call: $url\nHeader: $requestHeaders');
      debugPrint('====> API Body: $body');

      http.Response response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: headers ?? requestHeaders,
          )
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      return handleResponse(response, url);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(
      String url, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $url\nHeader: $requestHeaders');
      debugPrint('====> API Body: $body with ${multipartBody.length} picture');

      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers ?? requestHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(http.MultipartFile(
            multipart.key,
            multipart.file!.readAsBytes().asStream(),
            list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }
      request.fields.addAll(body);
      http.Response response =
          await http.Response.fromStream(await request.send());
      return handleResponse(response, url);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String url, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $url\nHeader: $requestHeaders');
      debugPrint('====> API Body: $body');

      http.Response response = await http
          .put(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: headers ?? requestHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, url);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String url,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $url\nHeader: $requestHeaders');

      http.Response response = await http
          .delete(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, url);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: errorResponse.errors![0].message);
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = Response(statusCode: 0, statusText: noInternetMessage);
    }

    debugPrint('====> API Response: [${response0.statusCode}] $uri');
    if (!kIsWeb || response.statusCode != 500) {
      debugPrint('${response0.body}', wrapWidth: 1024);
    }

    return response0;
  }
}

class MultipartBody {
  String key;
  File? file;

  MultipartBody(this.key, this.file);
}
