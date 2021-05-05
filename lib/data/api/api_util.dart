import 'package:path/path.dart';
import 'package:xiag_app/data/mapper/picture_mapper.dart';
import 'package:xiag_app/domain/model/picture.dart';

import 'service/xiag_service.dart';

class ApiUtil {
  final XiagService _xiagService;

  ApiUtil(this._xiagService);

  Future<List<Picture>> getPictures() async {
    final result = await _xiagService.getPictures();
    return PictureMapper.fromApi(result);
  }

  Future<String> getFilePath(String url) async {
    final fileName = basename(url);
    final response = await _xiagService.fetchFile(fileName);
    return PictureMapper.pathFromApi(fileName: fileName, response: response);
  }
}
