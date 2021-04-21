import 'package:flutter/material.dart';

class KBottomSheet extends StatelessWidget {
  final List<Widget> children;
  final double minHeight;
  KBottomSheet({required this.children, this.minHeight = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          minHeight: minHeight),
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
    );
  }
}
