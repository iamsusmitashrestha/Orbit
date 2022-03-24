import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';

class Carousel extends StatelessWidget {
  final int itemCount;
  final int carouselIndex;
  final double carouselHeight;
  final Function(void) onPageChanged;
  final Widget Function(BuildContext, int) itemBuilder;

  Carousel({
    required this.itemCount,
    required this.onPageChanged,
    required this.carouselIndex,
    required this.itemBuilder,
    required this.carouselHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: carouselHeight,
          child: PageView.builder(
            itemCount: itemCount,
            onPageChanged: onPageChanged,
            itemBuilder: itemBuilder,
          ),
        ),
        Container(
          color: Colors.black26,
          padding: sYPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < itemCount; i++)
                Padding(
                  padding: sPadding,
                  child: CircleAvatar(
                    radius: carouselIndex == i ? 6 : 4,
                    backgroundColor: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
