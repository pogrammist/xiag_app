import 'package:xiag_app/data/api/api_util.dart';
import 'package:xiag_app/domain/model/picture.dart';
import 'package:xiag_app/domain/repository/picture_repository.dart';

class PictureDataRepository extends PictureRepository {
  final ApiUtil _apiUtil;

  PictureDataRepository(this._apiUtil);

  @override
  Future<List<Picture>> getPictures() {
    return _apiUtil.getPictures();
  }

  @override
  Future<String> getFilePath({String url}) {
    return _apiUtil.getFilePath(url);
  }
}
