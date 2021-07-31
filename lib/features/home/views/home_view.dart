import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
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
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 32),
                  child: TextField(
                    onChanged: model.onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Search store or products.',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              model.isBusy
                  ? KBusy()
                  : Expanded(
                      child: KButton(
                        onPressed: model.search,
                        child: Text("Search"),
                        isBusy: model.isBusy,
                      ),
                    )
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
            sHeightSpan,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: LIGHT_GREY,
                ),
              ),
              child: DropdownButton(
                autofocus: true,
                iconSize: 40,
                isExpanded: true,
                value: model.selectedCategory,
                onChanged: model.onSelectionChanged,
                items: model.categoryResponse.map((category) {
                  return DropdownMenuItem(
                    child: new Text(category.label),
                    value: category,
                  );
                }).toList(),
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
                    onPressed: model.getStoreByDistance,
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
            model.storeResponse.isNotEmpty
                ? Column(
                    children: model.storeResponse
                        .map((store) => Card(
                              child: Padding(
                                padding: lPadding,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            store.storedetails!.logo,
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
                                                store.storedetails!.storeName!,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  store.storedetails!.address!,
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
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                borderRadius: BorderRadius
                                                    .circular(AppDimens
                                                        .CHIP_BORDER_RADIUS),
                                              ),
                                              child: Text(
                                                "${store.calculatedDistance!} KMs",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    ?.copyWith(
                                                        color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                    // model.storeResponse.map((e) => )
                  )
                : Container(),
            model.searchedStoreResponse.isNotEmpty
                ? Column(
                    children: model.searchedStoreResponse
                        .map((store) => Card(
                              child: Padding(
                                padding: lPadding,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            store.logo!,
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
                                                store.storeName!,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  store.address!,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: AppDimens.CHIP_PADDING,
                                          decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                            borderRadius: BorderRadius.circular(
                                                AppDimens.CHIP_BORDER_RADIUS),
                                          ),
                                          child: Text(
                                            store.storeStatus!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                    // model.storeResponse.map((e) => )
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
