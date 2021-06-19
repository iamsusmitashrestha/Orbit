import 'package:flutter/material.dart';

class cate extends StatelessWidget {
  const cate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Categories",
            style: TextStyle(
                fontFamily: "Opensans",
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
