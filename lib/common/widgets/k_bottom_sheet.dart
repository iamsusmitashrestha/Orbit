import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';

class KBottomSheet extends StatelessWidget {
  final List<Widget> children;
  final maxHeight;
  final bool hasHeight;
  KBottomSheet(
      {required this.children, this.maxHeight, this.hasHeight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: mPadding,
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxHeight: hasHeight
            ? MediaQuery.of(context).size.height * maxHeight
            : MediaQuery.of(context).size.height * 0.7,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                height: 6,
                width: MediaQuery.of(context).size.height * 0.15,
                margin: EdgeInsets.only(bottom: 16),
              ),
            ),
            ...this.children,
          ],
        ),
      ),
    );
  }
}
