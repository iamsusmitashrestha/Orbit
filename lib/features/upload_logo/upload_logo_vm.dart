import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@injectable
class UploadLogoViewModel extends BaseViewModel {
  File? _image;
  final picker = ImagePicker();
  // FormData formdata = new FormData();
  // final Dio? dio;

  // UploadLogoViewModel({required this.dio});

  get image => _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  }

  Future uploadLogo() async {
    try {} catch (e) {}
  }
}
