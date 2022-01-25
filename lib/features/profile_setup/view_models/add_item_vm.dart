import 'package:dio/dio.dart';
import 'dart:io';

import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class AddItemViewModel extends BaseViewModel {
  String itemName = "";
  String price = "";
  int carouselIndex = 0;

  List<XFile>? imageFileList = [];
  final ImagePicker imagePicker = ImagePicker();

  final Dio _dio;
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
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    notifyListeners();
  }

  // Future getImage() async {
  //   final pickedFileList = await _picker.pickMultiImage();

  //   imageFileList = pickedFileList;
  //   notifyListeners();
  // }

  void addItem() async {
    try {
      setBusy(true);
      var response = await _dio.post(
        "/product/${_userDataService.storeId}/addProduct",
        data: {
          'title': itemName,
          'price': price,
        },
      );
      _navigationService.back(result: SheetResponse(confirmed: true));
      setBusy(false);
    } on DioError catch (e) {
      setBusy(false);
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message);
      }
    }
  }
}
