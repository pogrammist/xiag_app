import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:xiag_app/domain/model/picture.dart';
import 'package:xiag_app/domain/repository/picture_repository.dart';

part 'viewer_state.g.dart';

class ViewerState = ViewerStateBase with _$ViewerState;

abstract class ViewerStateBase with Store {
  ViewerStateBase(this._pictureRepository);

  final PictureRepository _pictureRepository;

  @observable
  Picture picture;

  @observable
  bool isLoading = false;

  @observable
  String batteryLevel = 'Unknown battery level.';

  static const channel = const MethodChannel('xiag.flutter.dev/channel');

  @action
  Future<void> getBatteryLevel() async {
    try {
      final int result = await channel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
  }

  @action
  Future<void> sendMail() async {
    if (!isLoading) {
      isLoading = true;
      try {
        final path = await filePath;
        print('Flutter filePath: $path');
        await channel.invokeMethod(
          'sendMail',
          {'filePath': path},
        );
      } on PlatformException catch (e) {
        print(e.message);
      }
      isLoading = false;
    }
  }

  Future<String> get filePath async =>
      await _pictureRepository.getFilePath(url: picture.url);
}
