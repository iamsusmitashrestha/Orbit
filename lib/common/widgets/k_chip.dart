import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/themes/app_themes.dart';

enum ChipVariant { FILLED, BORDERED }

class KChip extends StatelessWidget {
  final String text;
  final ChipVariant variant;
  final Function()? onPressed;
  final bool selected;
  final bool removable;

  KChip(
      {required this.text,
      required this.variant,
      this.onPressed,
      this.selected = false,
      this.removable = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: AppDimens.CHIP_PADDING,
        decoration: BoxDecoration(
          color: variant == ChipVariant.FILLED
              ? selected
                  ? PRIMARY_COLOR
                  : CHIP_GREY
              : Colors.transparent,
          border: variant == ChipVariant.BORDERED
              ? Border.all(
                  color: selected ? Theme.of(context).primaryColor : CHIP_GREY)
              : null,
          borderRadius: BorderRadius.circular(AppDimens.CHIP_BORDER_RADIUS),
        ),
        child: Wrap(
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: selected ? Colors.white : null),
            ),
            if (removable)
              Wrap(
                children: [
                  sWidthSpan,
                  Icon(
                    Icons.cancel,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
