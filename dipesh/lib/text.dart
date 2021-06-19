import 'dart:ui';

import 'package:flutter/material.dart';

class text extends StatelessWidget {
  text({required this.data, this.Color, required this.width});

  late final String data;
  late final Color;
  late final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 45,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.transparent)),
          child: Text(
            data,
            style: TextStyle(
                fontFamily: "Opensans", fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
