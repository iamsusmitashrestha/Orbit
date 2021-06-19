import 'package:dipesh/circle.dart';
import 'package:flutter/material.dart';

class rows extends StatelessWidget {
  const rows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cirle(Color: Colors.grey),
          cirle(Color: Colors.blue),
          cirle(Color: Colors.grey),
          cirle(Color: Colors.grey),
        ],
      ),
    );
  }
}
