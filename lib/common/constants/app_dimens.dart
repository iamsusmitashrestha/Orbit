import 'package:flutter/material.dart';

/// App Dimensions class to reuse values that are used throughout the layout
/// Using a single source of dimensions will create robust ui development,
/// and also make design changes easier.

class AppDimens {
  static const PAGE_PADDING = EdgeInsets.all(20);
  static const PAGE_PADDING_LARGE = EdgeInsets.all(32);

  static const CARD_BORDER_RADIUS = BorderRadius.all(Radius.circular(32));
  static const double CARD_PADDING_SIZE = 28;
  static const CARD_PADDING = EdgeInsets.all(CARD_PADDING_SIZE);
  static const INPUT_BORDER_RADIUS = BorderRadius.all(Radius.circular(16));
  static const INPUT_PADDING =
      EdgeInsets.symmetric(horizontal: 24, vertical: 20);

  static const CHIP_PADDING =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const CHIP_BORDER_RADIUS = 16.0;

  static const BUTTON_FONT_SIZE_SMALL = 16.0;
  static const BUTTON_FONT_SIZE_MEDIUM = 17.0;
  static const BUTTON_FONT_SIZE_LARGE = 18.0;
  static const BUTTON_BORDER_RADIUS = 16.0;

  static const ICON_BUTTON_SIZE_SMALL = 24.0;
  static const ICON_BUTTON_SIZE_LARGE = 50.0;

  static const BUTTON_PADDING_SMALL =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const BUTTON_PADDING_MEDIUM =
      EdgeInsets.symmetric(horizontal: 24, vertical: 12);
  static const BUTTON_PADDING_LARGE =
      EdgeInsets.symmetric(horizontal: 32, vertical: 16);

  static const double BODY_FONT_SIZE = 14;

  static const double HEADLINE_FONT_SIZE_SMALL = 16;
  static const double HEADLINE_FONT_SIZE_MEDIUM = 24;
  static const double HEADLINE_FONT_SIZE_LARGE = 32;

  static const double MULTI_SELECT_SPACING = 8;
}
