import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/themes/app_themes.dart';

enum CardVariant { SECONDARY, PRIMARY, WHITE }

class KCard extends StatelessWidget {
  final CardVariant variant;
  final Widget child;
  final bool noPadding;
  final bool noBorderRadius;

  KCard(
      {required this.variant,
      required this.child,
      this.noPadding = false,
      this.noBorderRadius = false});

  Color getColorFromVariant(CardVariant _variant) {
    switch (_variant) {
      case CardVariant.PRIMARY:
        return LIGHT_PRIMARY_COLOR;
      case CardVariant.WHITE:
        return Colors.white;
      default:
        return SHUTTLE_GREY;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: noPadding ? EdgeInsets.zero : AppDimens.CARD_PADDING,
      decoration: BoxDecoration(
        color: getColorFromVariant(variant),
        borderRadius: noBorderRadius ? null : AppDimens.CARD_BORDER_RADIUS,
      ),
      child: child,
    );
  }
}
