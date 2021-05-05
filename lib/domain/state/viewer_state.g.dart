// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewerState on ViewerStateBase, Store {
  final _$pictureAtom = Atom(name: 'ViewerStateBase.picture');

  @override
  Picture get picture {
    _$pictureAtom.reportRead();
    return super.picture;
  }

  @override
  set picture(Picture value) {
    _$pictureAtom.reportWrite(value, super.picture, () {
      super.picture = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'ViewerStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$batteryLevelAtom = Atom(name: 'ViewerStateBase.batteryLevel');

  @override
  String get batteryLevel {
    _$batteryLevelAtom.reportRead();
    return super.batteryLevel;
  }

  @override
  set batteryLevel(String value) {
    _$batteryLevelAtom.reportWrite(value, super.batteryLevel, () {
      super.batteryLevel = value;
    });
  }

  final _$getBatteryLevelAsyncAction =
      AsyncAction('ViewerStateBase.getBatteryLevel');

  @override
  Future<void> getBatteryLevel() {
    return _$getBatteryLevelAsyncAction.run(() => super.getBatteryLevel());
  }

  final _$sendMailAsyncAction = AsyncAction('ViewerStateBase.sendMail');

  @override
  Future<void> sendMail() {
    return _$sendMailAsyncAction.run(() => super.sendMail());
  }

  @override
  String toString() {
    return '''
picture: ${picture},
isLoading: ${isLoading},
batteryLevel: ${batteryLevel}
    ''';
  }
}
