import 'package:flutter/material.dart';

class squa extends StatelessWidget {
  const squa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      width: width,
      color: Colors.grey[350],
    );
  }
}
