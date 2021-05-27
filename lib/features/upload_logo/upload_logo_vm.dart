import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class UploadLogoViewModel extends BaseViewModel {
  File? image;
  final picker = ImagePicker();

  final NavigationService _navigationService;
  UploadLogoViewModel(this._navigationService);
  // FormData formdata = new FormData();
  // final Dio? dio;

  // UploadLogoViewModel({required this.dio});

  // get image => _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    image = File(pickedFile!.path);
  }

  Future uploadLogo() async {
    try {} catch (e) {}
  }

  goToStoreProfile() {
    _navigationService.navigateTo(Routes.storeProfileViewRoute);
  }
}
