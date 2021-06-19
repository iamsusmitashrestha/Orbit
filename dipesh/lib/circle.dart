import 'package:flutter/material.dart';

class cirle extends StatelessWidget {
  const cirle({Key? key, @required this.Color});
  final Color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 12,
        width: 12,
        decoration:
            BoxDecoration(color: Color, borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
