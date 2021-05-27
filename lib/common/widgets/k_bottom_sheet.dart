import 'package:flutter/material.dart';

class KBottomSheet extends StatelessWidget {
  final List<Widget> children;
  KBottomSheet({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
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
