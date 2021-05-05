import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:xiag_app/data/api/model/api_picture.dart';

List<ApiPicture> parsePictures(dynamic responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ApiPicture>((json) => ApiPicture.fromApi(json)).toList();
}

class XiagService {
  static const _BASE_URL = "https://www.xiag.ch/share/testtask";

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<List<ApiPicture>> getPictures() async {
    final response = await _dio.get("/list.json");
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return compute(parsePictures, response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<http.Response> fetchFile(String fileName) async {
    final response = await http.get("$_BASE_URL/$fileName");
    switch (response.statusCode) {
      case 200:
        return response;
        break;
      default:
        throw response;
        break;
    }
  }
}
