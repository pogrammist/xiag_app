// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$searchControllerAtom = Atom(name: 'HomeStateBase.searchController');

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  final _$picturesAtom = Atom(name: 'HomeStateBase.pictures');

  @override
  ObservableList<Picture> get pictures {
    _$picturesAtom.reportRead();
    return super.pictures;
  }

  @override
  set pictures(ObservableList<Picture> value) {
    _$picturesAtom.reportWrite(value, super.pictures, () {
      super.pictures = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

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

  final _$getPicturesAsyncAction = AsyncAction('HomeStateBase.getPictures');

  @override
  Future<void> getPictures() {
    return _$getPicturesAsyncAction.run(() => super.getPictures());
  }

  @override
  String toString() {
    return '''
searchController: ${searchController},
pictures: ${pictures},
isLoading: ${isLoading}
    ''';
  }
}
