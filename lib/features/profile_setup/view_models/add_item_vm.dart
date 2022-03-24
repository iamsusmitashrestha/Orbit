import 'dart:io';

import 'package:dio/dio.dart' as DIO;
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class AddItemViewModel extends BaseViewModel {
  String itemName = "";
  String price = "";
  int carouselIndex = 0;

  List<XFile> imageFileList = [];
  final ImagePicker imagePicker = ImagePicker();
  final DIO.Dio _dio;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;
  final UserDataService _userDataService;

  AddItemViewModel(this._dio, this._snackbarService, this._navigationService,
      this._userDataService);

  onNameChanged(value) {
    itemName = value;
  }

  onPriceChanged(value) {
    price = value;
  }

  setCarouselIndex(index) {
    carouselIndex = index;
    notifyListeners();
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList.length.toString());
    notifyListeners();
  }

  void addItem() async {
    try {
      setBusy(true);

      List<DIO.MultipartFile> images = [];
      for (var file in imageFileList) {
        images.add(
            await DIO.MultipartFile.fromFile(file.path, filename: file.name));
      }

      DIO.FormData data = DIO.FormData.fromMap({
        "title": itemName,
        "price": price,
        "images": images
        // ?.map((e) => DIO.MultipartFile.fromFile(e.path, filename: e.name))
        // .toList()
      });

      var response = await _dio.post(
        "/product/${_userDataService.storeId}/addProduct",
        data: data,
      );

      _snackbarService.showSnackbar(
        message: response.data['message'],
        duration: Duration(seconds: 1),
      );
      setBusy(false);
      Future.delayed(const Duration(seconds: 1), () {
        _navigationService.clearTillFirstAndShow(Routes.inventoryViewRoute);
      });
    } on DIO.DioError catch (e) {
      setBusy(false);
      if (e.type == DIO.DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DIO.DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message);
      }
    }
  }
}
