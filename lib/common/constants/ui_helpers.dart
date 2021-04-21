import 'package:flutter/material.dart';

/// These are a bunch of padding and spacing helpers, to facilitate fast writing of spacings,
/// as well as make a bunch of speed optimizations due to constant value during rebuild.

// ---- Vertical Spacing ----
const xxsHeightSpan = SizedBox(height: 2);
const xsHeightSpan = SizedBox(height: 4);
const sHeightSpan = SizedBox(height: 8);
const mHeightSpan = SizedBox(height: 16);
const lHeightSpan = SizedBox(height: 24);
const elHeightSpan = SizedBox(height: 48);

// ---- Horizontal Spacing ----
const xxsWidthSpan = SizedBox(width: 2);
const xsWidthSpan = SizedBox(width: 4);
const sWidthSpan = SizedBox(width: 8);
const mWidthSpan = SizedBox(width: 16);
const lWidthSpan = SizedBox(width: 24);
const elWidthSpan = SizedBox(width: 48);

// ---- Page Paddings ----
const lPagePadding = EdgeInsets.symmetric(horizontal: 64);
const mPagePadding = EdgeInsets.symmetric(horizontal: 32);
const mXPagePadding = EdgeInsets.symmetric(horizontal: 32);
const mYPagePadding = EdgeInsets.symmetric(vertical: 32);
const sXPagePadding = EdgeInsets.symmetric(horizontal: 16);
const sYPagePadding = EdgeInsets.symmetric(vertical: 16);
const sPagePadding = EdgeInsets.all(16);

// ---- Container Padding ----
const sPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 8);
const sXPadding = EdgeInsets.symmetric(horizontal: 8);
const xsYPadding = EdgeInsets.symmetric(vertical: 4);
const sYPadding = EdgeInsets.symmetric(vertical: 8);
const mPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 12);
const mXPadding = EdgeInsets.symmetric(horizontal: 12);
const mYPadding = EdgeInsets.symmetric(vertical: 12);
const lPadding = EdgeInsets.symmetric(horizontal: 18, vertical: 18);
const lXPadding = EdgeInsets.symmetric(horizontal: 18);
const lYPadding = EdgeInsets.symmetric(vertical: 18);

const xlPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 24);
const xlXPadding = EdgeInsets.symmetric(horizontal: 24);
const xlYPadding = EdgeInsets.symmetric(vertical: 24);
