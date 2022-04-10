import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

import '../view_models/home_vm.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: model.goToOrderView,
                title: Text("My Orders"),
                leading: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              ),
              ListTile(
                onTap: model.logOut,
                title: Text("Logout"),
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            Text(
              "(${model.cart.length})",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.white,
              ),
              onPressed: model.goToCartView,
            ),
          ],
          backgroundColor: PRIMARY_COLOR,
        ),
        body: ListView(
          padding: mPadding,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 12, right: 10, bottom: 12, top: 28),
                    child: TextField(
                      onChanged: model.onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'Search products.',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: KButton(
                    onPressed: model.search,
                    child: Text("Search"),
                    isBusy: model.busy(model.searchedStoreResponse),
                  ),
                )
              ],
            ),
            Divider(
              height: 40,
              thickness: 1,
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: lPadding,
                child: Column(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                    Row(
                      children: [
                        Text(
                          "Max Distance",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sWidthSpan,
                        Expanded(
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: model.onDistanceChanged,
                            ),
                          ),
                        ),
                        sWidthSpan,
                        Text(
                          "KMs",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        mWidthSpan,
                      ],
                    ),
                    sHeightSpan,
                    KButton(
                      child: Text("Find"),
                      onPressed: model.getStoreByDistance,
                      isBusy: model.busy(model.storeResponse),
                    )
                  ],
                ),
              ),
            ),
            xsHeightSpan,
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
                        .map((store) => InkWell(
                              onTap: () => model.goToProfileView(store),
                              child: Card(
                                child: Padding(
                                  padding: lPadding,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  store.storedetails!.storeName,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    store.storedetails!.address,
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
                              ),
                            ))
                        .toList(),
                  )
                : Container(),
            model.searchedStoreResponse.isNotEmpty
                ? Column(
                    children: model.searchedStoreResponse
                        .map((store) => InkWell(
                              onTap: () => model.goToSearchedProfileView(store),
                              child: Card(
                                child: Padding(
                                  padding: lPadding,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  store.storedetails!.storeName,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    store.storedetails!.address,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: store.storedetails!
                                                              .status ==
                                                          "Open"
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                              xsWidthSpan,
                                              Text(
                                                store.storedetails!.status,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: store.storedetails!
                                                              .status ==
                                                          "Open"
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Container(
                                          //   padding: AppDimens.CHIP_PADDING,
                                          //   decoration: BoxDecoration(
                                          //     color: store.storeStatus == "Open"
                                          //         ? Colors.green
                                          //         : Colors.red,
                                          //     borderRadius: BorderRadius.circular(
                                          //         AppDimens.CHIP_BORDER_RADIUS),
                                          //   ),
                                          //   child: Text(
                                          //     store.storeStatus!,
                                          //     style: Theme.of(context)
                                          //         .textTheme
                                          //         .subtitle1
                                          //         ?.copyWith(color: Colors.white),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
