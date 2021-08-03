import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/features/profile/view_models/searched_profile_vm.dart';
import 'package:orbit/features/profile/views/table_view.dart';
import 'package:orbit/features/profile/widgets/table_text.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class SearchedStoreProductView
    extends ViewModelWidget<SearchedProfileViewModel> {
  @override
  Widget build(BuildContext context, SearchedProfileViewModel model) {
    if (model.items.isNotEmpty) {
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          TableView(),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: sPadding,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
                      TableRow(
                        children: [
                          TableText(text: (index + 1).toString()),
                          TableText(text: model.items[index].title),
                          TableText(text: model.items[index].price.toString()),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ],
      );
    }
    return Container();
  }
}
