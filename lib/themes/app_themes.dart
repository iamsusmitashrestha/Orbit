import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';

const FONT_FAMILY = "Quicksand";
const DISABLED_COLOR = Color(0xFFbcbcbc);
const PRIMARY_COLOR = Color(0XFF10588C);
const SECONDARY_COLOR = Color(0XFF3CA2EA);
const INPUT_BORDER_COLOR = Color(0XFFdddddd);
const LIGHT_PRIMARY_COLOR = Color(0xFFe6f0ff);
const SHUTTLE_GREY = Color(0xFFf4f4f4);
const ERROR_COLOR = Color(0xFFe10000);
const SUCCESS_COLOR = Color(0xFF6dd819);
const WARNING_COLOR = Color(0xFFfce8bb);
const WARNING_ICON_COLOR = Color(0xFFf3b31c);
const DARK_GREY = Color(0xFF959595);
const LIGHT_GREY = Color(0xFFdedede);
const CHIP_GREY = Color(0xFFC4C4C4);
const CURSOR_COLOR = Color(0xFF666666);
const BODY_COLOR = Color(0xFF000000);
const INPUT_SUFFIX_ICON_COLOR = Color(0xFF6dd819);

const ERROR_BORDER = OutlineInputBorder(
  borderRadius: AppDimens.INPUT_BORDER_RADIUS,
  borderSide: BorderSide(
    color: ERROR_COLOR,
  ),
);

const ENABLED_BORDER = OutlineInputBorder(
  borderRadius: AppDimens.INPUT_BORDER_RADIUS,
  borderSide: BorderSide(
    color: LIGHT_GREY,
  ),
);

const FOCUSED_BORDER = OutlineInputBorder(
  borderRadius: AppDimens.INPUT_BORDER_RADIUS,
  borderSide: BorderSide(
    color: DARK_GREY,
  ),
);

abstract class AppThemes {
  static ThemeData light = ThemeData.light().copyWith(
    primaryColor: PRIMARY_COLOR,
    errorColor: ERROR_COLOR,
    textSelectionTheme: ThemeData.light().textSelectionTheme.copyWith(
          cursorColor: CURSOR_COLOR,
        ),
    textTheme: ThemeData.light()
        .textTheme
        .apply(
          bodyColor: BODY_COLOR,
          fontFamily: FONT_FAMILY,
        )
        .copyWith(
          bodyText1: ThemeData.light().textTheme.bodyText1?.copyWith(
                fontSize: AppDimens.BODY_FONT_SIZE,
              ),
        ),
    inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
          contentPadding: AppDimens.INPUT_PADDING,
          fillColor: Colors.white,
          enabledBorder: ENABLED_BORDER,
          focusedBorder: FOCUSED_BORDER,
          errorBorder: ERROR_BORDER,
          focusedErrorBorder: ERROR_BORDER,
        ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
    // scaffoldBackgroundColor: SHUTTLE_GREY,
    cardTheme: ThemeData.light()
        .cardTheme
        .copyWith(margin: EdgeInsets.symmetric(vertical: 4)),
    // floatingActionButtonTheme:
    //     ThemeData.light().floatingActionButtonTheme.copyWith(
    //           backgroundColor: ACCENT_COLOR,
    //         ),
  );

  // static ThemeData dark = ThemeData.dark().copyWith(
  //   primaryColor: PRIMARY_COLOR,
  //   errorColor: ERROR_COLOR,
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   textTheme: GoogleFonts.poppinsTextTheme().apply(
  //     bodyColor: Colors.white,
  //   ),
  //   cardTheme: ThemeData.dark()
  //       .cardTheme
  //       .copyWith(margin: EdgeInsets.symmetric(vertical: 4)),
  //   // floatingActionButtonTheme:
  //   //     ThemeData.dark().floatingActionButtonTheme.copyWith(
  //   //           backgroundColor: PRIMARY_COLOR,
  //   //         ),
  // );
}
