import 'package:dipesh/text.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: Row(children: [
        text(
          data: "All",
          width: 70,
          Color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: text(
            data: "Vegetable Shop",
            width: 170,
            Color: Colors.grey[350],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: text(
            data: "Dairy",
            width: 80,
            Color: Colors.grey[350],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: text(
            data: "Water",
            width: 80,
            Color: Colors.grey[350],
          ),
        ),
      ]),
    );
  }
}
