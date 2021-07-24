import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_chip.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

import '../home_vm.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(400),
          child: Row(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 32),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search store or products.',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: Text("Search"))
            ],
          ),
        ),
        body: ListView(
          padding: mPadding,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 22,
                fontFamily: FONT_FAMILY,
                fontWeight: FontWeight.w500,
              ),
            ),
            mHeightSpan,
            Container(
              height: 40,
              child: ListView.builder(
                itemCount: model.categoryResponse.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    child: KChip(
                      text: model.categoryResponse[index].label,
                      variant: ChipVariant.FILLED,
                      onPressed: () {
                        model.onSelectionChanged(index);
                      },
                      selected: model.categoryResponse[index].value ==
                          model.selectedCategory!.value,
                    ),
                  );
                },
              ),
            ),
            lHeightSpan,
            Text(
              "Max Distance",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            xsHeightSpan,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: model.onDistanceChanged,
                    ),
                  ),
                ),
                mWidthSpan,
                Text(
                  "KMs",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                elWidthSpan,
                Expanded(
                  child: KButton(
                    child: Text("Find"),
                    onPressed: () {},
                    isBusy: model.isBusy,
                  ),
                )
              ],
            ),
            lHeightSpan,
            Text(
              "Results",
              style: TextStyle(
                fontSize: 22,
                fontFamily: FONT_FAMILY,
                fontWeight: FontWeight.w500,
              ),
            ),
            mHeightSpan,
            Card(
              child: Padding(
                padding: lPadding,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            model.userDataService.logo!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        sWidthSpan,
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                model.userDataService.storeName!,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  model.userDataService.address!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            // Text(model.userDataService.storeStatus!),
                            Container(
                              padding: AppDimens.CHIP_PADDING,
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(
                                    AppDimens.CHIP_BORDER_RADIUS),
                              ),
                              child: Text(
                                "1.2 KMS",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
