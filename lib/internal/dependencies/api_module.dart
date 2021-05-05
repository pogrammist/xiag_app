import 'package:xiag_app/data/api/api_util.dart';
import 'package:xiag_app/data/api/service/xiag_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(XiagService());
    }
    return _apiUtil;
  }
}
