import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_plugin/flutter_exif_plugin.dart' as dd;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/cadastrar_arvore_store.dart';
import 'package:forestinv_mobile/app/screens/camera/preview_page.dart';
import 'package:forestinv_mobile/app/stores/grid_photo_store.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_pixels/image_pixels.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;
  final gridPhotoStore = Modular.get<GridPhotoStore>();
  final cadastrarArvoreStore = Modular.get<CadastrarArvoreStore>();

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      final XFile picture = await _cameraController.takePicture();
      final XFile file = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewPage(
            picture: picture,
          ),
        ),
      );
      print('Path arquivo: ${file.path}');
      _addWidgetList(file);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future<void> _addWidgetList(final XFile file) async {
    final File fileWithGPS = await _addGPS(file);

    final widget = Image.file(
      File(fileWithGPS.path),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
    );
    gridPhotoStore.setArquivo(file);
    gridPhotoStore.addWidgetPhoto(widget);
  }

  Future<File> _addGPS(final XFile file) async {
    final exif = dd.FlutterExif.fromBytes(await file.readAsBytes());

    final Position position = await cadastrarArvoreStore.getLatLong();

    await exif.setLatLong(position.latitude, position.longitude);
    await exif.saveAttributes();

    final modifiedImage = await exif.imageData;
    //const imageName = "imgName..";
    final File imageFile = File("${file.path}");
    imageFile.writeAsBytes(
      List.from(modifiedImage!),
    );
    return imageFile;
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            (_cameraController.value.isInitialized)
                ? CameraPreview(_cameraController)
                : Container(
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                    color: Colors.black),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        icon: Icon(
                            _isRearCameraSelected
                                ? Icons.switch_camera
                                : Icons.switch_camera_outlined,
                            color: Colors.white),
                        onPressed: () {
                          setState(() =>
                              _isRearCameraSelected = !_isRearCameraSelected);
                          initCamera(
                              widget.cameras![_isRearCameraSelected ? 0 : 1]);
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: takePicture,
                        iconSize: 50,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.circle, color: Colors.white),
                      ),
                    ),
                    //const Spacer(),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Modular.to.pop();
                        },
                        iconSize: 50,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.close_rounded,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
