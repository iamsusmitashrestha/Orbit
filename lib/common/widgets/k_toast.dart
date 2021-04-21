import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/core/services/toast_service.dart';

class KToast extends StatelessWidget {
  final ToastVariant variant;
  final String message;

  KToast({
    required this.variant,
    required this.message,
  });

  Color getColor(ToastVariant variant) {
    switch (variant) {
      case ToastVariant.SUCCESS:
        return Colors.green;
      case ToastVariant.ERROR:
        return Colors.red;
      case ToastVariant.WARNING:
        return Colors.orange;
      case ToastVariant.INFO:
        return Colors.blueAccent;
    }
  }

  IconData getIcon(ToastVariant variant) {
    switch (variant) {
      case ToastVariant.SUCCESS:
        return Icons.check_circle;

      case ToastVariant.ERROR:
        return Icons.cancel;

      case ToastVariant.WARNING:
        return Icons.warning;

      case ToastVariant.INFO:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: getColor(variant),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 2,
            color: getColor(variant).withOpacity(0.25),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(getIcon(variant), color: Colors.white),
          mWidthSpan,
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
