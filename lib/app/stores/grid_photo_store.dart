import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/screens/camera/camera_page.dart';
import 'package:mobx/mobx.dart';
part 'grid_photo_store.g.dart';

class GridPhotoStore = GridPhotoStoreBase with _$GridPhotoStore;

abstract class GridPhotoStoreBase with Store {
  @observable
  XFile? arquivo;

  @action
  void setArquivo(final XFile value) => arquivo = value;

  List<File> files = [];

  @observable
  ObservableList<Widget> photos = ObservableList();

  @action
  void addWidgetPhoto(final Widget widgetPhoto) {
    photos.insert(0, widgetPhoto);
  }

  Future<void> openCamera(final BuildContext context) async {
    await availableCameras().then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CameraPage(cameras: value),
        ),
      ),
    );
  }

  Future<void> showPreview(dynamic file) async {
    file = await Modular.to.popAndPushNamed(
        '${RouterConst.PROJECT_ROUTER}${RouterConst.ARVORE_ROUTER}/preview',
        arguments: file);

    if (file != null) {
      setArquivo(file);
      print('Path arquivo: ${arquivo!.path}');
    }
  }
}
