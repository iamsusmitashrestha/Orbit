import 'package:flutter/material.dart';
import 'package:orbit/features/profile/view_models/profile_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class BtmNavigationView extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              // onTap: () => model.setTabIndex(0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                color: model.currentIndex == 0 ? PRIMARY_COLOR : SHUTTLE_GREY,
                child: Text(
                  "Items",
                  style: TextStyle(
                    color:
                        model.currentIndex == 0 ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              // onTap: () => model.setTabIndex(1),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                color: model.currentIndex == 1 ? PRIMARY_COLOR : SHUTTLE_GREY,
                child: Text(
                  "Location",
                  style: TextStyle(
                    color:
                        model.currentIndex == 1 ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              // onTap: () => model.setTabIndex(2),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                color: model.currentIndex == 2 ? PRIMARY_COLOR : SHUTTLE_GREY,
                child: Text(
                  "Store Details",
                  style: TextStyle(
                    color:
                        model.currentIndex == 2 ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
