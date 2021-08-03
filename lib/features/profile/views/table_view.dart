import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/features/profile/widgets/table_text.dart';
import 'package:orbit/themes/app_themes.dart';

class TableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: SHUTTLE_GREY,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0, // soften the shadow
            spreadRadius: 0, //extend the shadow
            offset: Offset(
              0, // Move to right 10  horizontally
              0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Table(
        border: TableBorder(
          verticalInside: BorderSide(
            color: SHUTTLE_GREY,
            width: 2,
          ),
          horizontalInside: BorderSide(
            color: SHUTTLE_GREY,
            width: 2,
          ),
        ),
        children: [
          TableRow(children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "S.N",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Item Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Price (Rs.)",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
