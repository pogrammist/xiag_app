import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:xiag_app/data/api/model/api_picture.dart';
import 'package:xiag_app/domain/model/picture.dart';

class PictureMapper {
  static List<Picture> fromApi(List<ApiPicture> pictures) {
    return pictures
        .map<Picture>((picture) => Picture(
              url: picture.url,
              urlTn: picture.urlTn,
              name: picture.name,
            ))
        .toList();
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  static Future<String> pathFromApi({
    @required String fileName,
    @required http.Response response,
  }) async {
    final file = await _localFile(fileName);
    file.writeAsBytes(response.bodyBytes);
    return file.path;
  }
}
