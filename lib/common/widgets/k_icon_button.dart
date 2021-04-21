import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/themes/app_themes.dart';

enum IconButtonSize { SMALL, LARGE }

class KIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool filled;
  final IconButtonSize size;
  final IconData iconFill;
  final IconData iconBorder;
  final Color fillColor;

  KIconButton({
    this.onPressed,
    this.filled = false,
    this.size = IconButtonSize.SMALL,
    this.iconFill = Icons.favorite,
    this.iconBorder = Icons.favorite_border,
    this.fillColor = ERROR_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        filled ? iconFill : iconBorder,
        color: filled ? fillColor : null,
        size: size == IconButtonSize.SMALL
            ? AppDimens.ICON_BUTTON_SIZE_SMALL
            : AppDimens.ICON_BUTTON_SIZE_LARGE,
      ),
      onPressed: onPressed,
    );
  }
}
