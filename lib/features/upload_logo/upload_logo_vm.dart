import 'dart:io';
import 'package:dio/dio.dart' as DIO;
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class UploadLogoViewModel extends BaseViewModel {
  File? image;
  final picker = ImagePicker();

  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final DIO.Dio _dio;
  final UserDataService _userDataService;
  UploadLogoViewModel(this._navigationService, this._dio, this._userDataService,
      this._snackbarService);

  Future getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    image = File(pickedFile!.path);
    notifyListeners();
  }

  void uploadLogo() async {
    setBusy(true);
    try {
      if (image != null) {
        String filename = image!.path.split("/").last;
        DIO.FormData formData = DIO.FormData.fromMap({
          'logo': await DIO.MultipartFile.fromFile(
            image!.path,
            filename: filename,
          ),
        });
        var response = await _dio.post(
          "/store/${_userDataService.storeId}/logo",
          data: formData,
        );
        _userDataService.logo = _dio.options.baseUrl + response.data['logo'];
        print("Sus:${_userDataService.logo}");
        _snackbarService.showSnackbar(
            message: "Logo uploaded!", duration: Duration(seconds: 1));

        await Future.delayed(
          Duration(seconds: 1),
        );
        goToStoreProfile();
      }
    } on DIO.DioError catch (e) {
      if (e.type == DIO.DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DIO.DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message);
      }
      setBusy(false);
    }
  }

  goToStoreProfile() {
    _navigationService.clearStackAndShow(Routes.storeProfileViewRoute);
  }
}
