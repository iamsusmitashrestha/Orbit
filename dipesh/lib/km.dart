import 'package:flutter/material.dart';

class km extends StatelessWidget {
  const km({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.white,
                child: Text("Max Distance",
                    style: TextStyle(fontFamily: "Opensans", fontSize: 20))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Text(
                    "10",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Container(
                      color: Colors.white,
                      child: Text("KMs",
                          style:
                              TextStyle(fontFamily: "Opensans", fontSize: 23))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
