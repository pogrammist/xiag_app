// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xiag_app/domain/model/picture.dart';

abstract class PictureRepository {
  Future<List<Picture>> getPictures();

  Future<String> getFilePath({@required String url});
}
