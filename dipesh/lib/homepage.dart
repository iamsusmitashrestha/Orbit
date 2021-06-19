import 'package:dipesh/box.dart';
import 'package:dipesh/cate.dart';
import 'package:dipesh/circle.dart';
import 'package:dipesh/km.dart';
import 'package:dipesh/result.dart';
import 'package:dipesh/rows.dart';
import 'package:dipesh/squa.dart';
import 'package:dipesh/test.dart';
import 'package:dipesh/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 30,
        ),
        squa(),
        SizedBox(
          height: 10,
        ),
        rows(),
        SizedBox(
          height: 5,
        ),
        cate(),
        test(),
        km(),
        SizedBox(
          height: 6,
        ),
        result(),
        box(),
        box()
      ]),
    );
  }
}
