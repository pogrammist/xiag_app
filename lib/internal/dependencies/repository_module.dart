import 'package:xiag_app/data/repository/picture_data_repository.dart';
import 'package:xiag_app/domain/repository/picture_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static PictureRepository _pictureRepository;

  static PictureRepository pictureRepository() {
    if (_pictureRepository == null) {
      _pictureRepository = PictureDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _pictureRepository;
  }
}
