import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Container(
            color: Colors.white,
            child: Text("Results",
                style: TextStyle(fontFamily: "Opensans", fontSize: 20))),
      ),
    );
  }
}
