import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xiag_app/domain/model/picture.dart';
import 'package:xiag_app/domain/repository/picture_repository.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._pictureRepository);

  final PictureRepository _pictureRepository;

  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  ObservableList<Picture> pictures = ObservableList();

  @observable
  bool isLoading = false;

  @action
  Future<void> getPictures() async {
    if (!isLoading) {
      isLoading = true;
      try {
        pictures = ObservableList.of(await _pictureRepository.getPictures());
      } catch (err) {
        print(err);
      }
      isLoading = false;
    }
  }
}
