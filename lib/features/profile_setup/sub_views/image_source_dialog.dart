import 'dart:io';

import 'package:dio/dio.dart' as DIO;
import 'package:flutter/material.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_bottom_sheet.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_card.dart';
import 'package:orbit/common/widgets/k_headline.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked_services/stacked_services.dart';

class ImageSourceDialog extends StatefulWidget {
  final void Function() onSucces;

  const ImageSourceDialog({required this.onSucces, Key? key}) : super(key: key);

  @override
  State<ImageSourceDialog> createState() => _ImageSourceDialogState();
}

class _ImageSourceDialogState extends State<ImageSourceDialog> {
  XFile? image;

  bool busy = false;

  final dio = locator<DIO.Dio>();
  final _snackbarService = locator<SnackbarService>();

  void selectImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final newImage = await _picker.pickImage(source: source, imageQuality: 50);
    setState(() {
      image = newImage;
    });
  }

  void submitImage() async {
    setState(() {
      busy = true;
    });

    final formData = DIO.FormData.fromMap({
      "qr": await DIO.MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
        contentType: MediaType.parse(image?.mimeType ?? "image/png"),
      ),
    });

    try {
      final response = await dio.post("/store/paymentqr", data: formData);

      widget.onSucces();
      await Future.delayed(const Duration(milliseconds: 300));
      Navigator.of(context).pop();
    } on DIO.DioError catch (e) {
      if (e.type == DIO.DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DIO.DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }

    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return KBottomSheet(
      children: [
        if (image == null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KHeadline("Select an image source:"),
              mHeightSpan,
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectImage(ImageSource.camera);
                      },
                      child: KCard(
                          variant: CardVariant.WHITE,
                          child: Column(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 32,
                              ),
                              sHeightSpan,
                              KHeadline("From Camera"),
                            ],
                          )),
                    ),
                  ),
                  mWidthSpan,
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectImage(ImageSource.gallery);
                      },
                      child: KCard(
                          variant: CardVariant.WHITE,
                          child: Column(
                            children: [
                              Icon(
                                Icons.photo,
                                size: 32,
                              ),
                              sHeightSpan,
                              KHeadline("From Gallery"),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ],
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(
                File(image!.path),
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              sHeightSpan,
              const Text(
                  "Note: The preview may have image cropped to fit the screen. After upload it shall be of same dimensions."),
              sHeightSpan,
              Row(
                children: [
                  Expanded(
                    child: KButton(
                      size: ButtonSize.SMALL,
                      child: const Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  sWidthSpan,
                  Expanded(
                    child: KButton(
                      isBusy: busy,
                      size: ButtonSize.SMALL,
                      child: const Text("Confirm"),
                      onPressed: () {
                        submitImage();
                      },
                    ),
                  ),
                ],
              )
            ],
          )
      ],
    );
  }
}
