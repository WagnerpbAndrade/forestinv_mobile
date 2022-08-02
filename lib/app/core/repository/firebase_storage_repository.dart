import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:forestinv_mobile/app/core/interface/api_response.dart';

class FirebaseStorageRepository {
  final FirebaseStorage instace;

  FirebaseStorageRepository(this.instace);

  Future<ApiResponse> uploadPhotoList(
      final String path, final File file) async {
    final ref = instace.ref(path);

    try {
      await ref.putFile(file);

      return ApiResponse.ok();
    } catch (e) {
      return ApiResponse.error(result: e);
    }
  }

  @override
  Future<ListResult> fetchAllPhotosByArvore(final String arvoreId) async {
    return FirebaseStorage.instance.ref("arvores/$arvoreId").listAll();
  }
}
