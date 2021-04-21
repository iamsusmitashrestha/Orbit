import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:oktoast/oktoast.dart';
import 'package:orbit/common/widgets/k_toast.dart';

enum ToastVariant { SUCCESS, ERROR, WARNING, INFO }

@lazySingleton
class ToastService {
  ToastFuture s(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.SUCCESS, duration: duration);

  ToastFuture e(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.ERROR, duration: duration);

  ToastFuture w(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.WARNING, duration: duration);

  ToastFuture i(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.INFO, duration: duration);

  ToastFuture show(String message,
      {required ToastVariant variant, Duration? duration}) {
    return showToastWidget(
      KToast(message: message, variant: variant),
      position: ToastPosition.bottom,
      animationCurve: Curves.easeIn,
      dismissOtherToast: true,
      duration: duration,
    );
  }
}
