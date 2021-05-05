import 'package:xiag_app/domain/state/viewer_state.dart';

import 'repository_module.dart';

class ViewerModule {
  static ViewerState viewerState() {
    return ViewerState(
      RepositoryModule.pictureRepository(),
    );
  }
}
