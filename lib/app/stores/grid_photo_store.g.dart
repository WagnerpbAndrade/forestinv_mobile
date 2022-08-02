// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_photo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GridPhotoStore on GridPhotoStoreBase, Store {
  late final _$arquivoAtom =
      Atom(name: 'GridPhotoStoreBase.arquivo', context: context);

  @override
  XFile? get arquivo {
    _$arquivoAtom.reportRead();
    return super.arquivo;
  }

  @override
  set arquivo(XFile? value) {
    _$arquivoAtom.reportWrite(value, super.arquivo, () {
      super.arquivo = value;
    });
  }

  late final _$photosAtom =
      Atom(name: 'GridPhotoStoreBase.photos', context: context);

  @override
  ObservableList<Widget> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<Widget> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  late final _$GridPhotoStoreBaseActionController =
      ActionController(name: 'GridPhotoStoreBase', context: context);

  @override
  void setArquivo(XFile value) {
    final _$actionInfo = _$GridPhotoStoreBaseActionController.startAction(
        name: 'GridPhotoStoreBase.setArquivo');
    try {
      return super.setArquivo(value);
    } finally {
      _$GridPhotoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addWidgetPhoto(Widget widgetPhoto) {
    final _$actionInfo = _$GridPhotoStoreBaseActionController.startAction(
        name: 'GridPhotoStoreBase.addWidgetPhoto');
    try {
      return super.addWidgetPhoto(widgetPhoto);
    } finally {
      _$GridPhotoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
arquivo: ${arquivo},
photos: ${photos}
    ''';
  }
}
