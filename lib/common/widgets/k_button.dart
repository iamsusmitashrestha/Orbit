import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';

enum ButtonSize { SMALL, MEDIUM, LARGE }

class KButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final ButtonSize size;
  final bool isBusy;

  KButton({
    required this.child,
    required this.onPressed,
    this.isBusy = false,
    this.size = ButtonSize.MEDIUM,
  });

  double getFontSizeBySize(ButtonSize size) {
    switch (size) {
      case ButtonSize.SMALL:
        return AppDimens.BUTTON_FONT_SIZE_SMALL;
      case ButtonSize.MEDIUM:
        return AppDimens.BUTTON_FONT_SIZE_MEDIUM;
      case ButtonSize.LARGE:
        return AppDimens.BUTTON_FONT_SIZE_LARGE;
    }
  }

  EdgeInsetsGeometry getPaddingBySize(ButtonSize size) {
    switch (size) {
      case ButtonSize.SMALL:
        return AppDimens.BUTTON_PADDING_SMALL;
      case ButtonSize.MEDIUM:
        return AppDimens.BUTTON_PADDING_MEDIUM;
      case ButtonSize.LARGE:
        return AppDimens.BUTTON_PADDING_LARGE;
    }
  }

  double getProgressRadiusByButtonSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.SMALL:
        return 18;
      case ButtonSize.MEDIUM:
        return 20;
      case ButtonSize.LARGE:
        return 22;
    }
  }

  double getProgressWidthByButtonSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.SMALL:
        return 2;
      case ButtonSize.MEDIUM:
        return 3;
      case ButtonSize.LARGE:
        return 3;
    }
  }

  /// Button is wrapped inside of theme to change the font-size of the
  /// child text widget based on the size passed.
  ///
  /// The buttons can be wrapped to fit content by Wrapping it inside of Row,
  /// and setting the mainAxisSize: MainAxisSize.min

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
              button: Theme.of(context).textTheme.button?.copyWith(
                    fontSize: getFontSizeBySize(size),
                    fontWeight: FontWeight.w500,
                  ),
            ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: getPaddingBySize(size),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.BUTTON_BORDER_RADIUS),
            ),
          ),
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Theme.of(context).primaryColor.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return Theme.of(context).primaryColor.withOpacity(0.5);
              } else {
                return Theme.of(context).primaryColor;
              }
            },
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isBusy)
              Row(
                children: [
                  SizedBox(
                    width: getProgressRadiusByButtonSize(size),
                    height: getProgressRadiusByButtonSize(size),
                    child: CircularProgressIndicator(
                      strokeWidth: getProgressWidthByButtonSize(size),
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                  sWidthSpan,
                ],
              ),
            child,
          ],
        ),
        onPressed: isBusy ? null : onPressed,
      ),
    );
  }
}
