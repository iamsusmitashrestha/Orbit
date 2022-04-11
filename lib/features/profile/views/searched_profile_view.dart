import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/carousel.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/home/model/searched_store.dart';

import 'package:orbit/features/profile/view_models/searched_profile_vm.dart';
import 'package:orbit/features/profile/views/bottom_navigation_view.dart';
import 'package:orbit/features/profile/views/searched_map_view.dart';
import 'package:orbit/features/profile/views/searched_store_product_view.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

import 'searched_detail_view.dart';

class SearchedProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchedStoreModel store =
        ModalRoute.of(context)!.settings.arguments as SearchedStoreModel;

    return ViewModelBuilder<SearchedProfileViewModel>.reactive(
      viewModelBuilder: () => locator<SearchedProfileViewModel>(),
      onModelReady: (model) => model.initialise(store),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationView(),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: model.goBack,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      store.storedetails!.storeName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    xsHeightSpan,
                    Row(
                      children: [
                        Icon(Icons.location_on, color: PRIMARY_COLOR),
                        sWidthSpan,
                        Text(
                          store.storedetails!.address,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        sWidthSpan,
                        Text(
                          store.storedetails!.hints ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    sHeightSpan,
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                        sWidthSpan,
                        Text(
                          store.contactNumber.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    sHeightSpan,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Opens at : ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                              ),
                            ),
                            Text(
                                "${store.storedetails!.openingTime ?? ""} - ${store.storedetails!.closingTime ?? ""}"),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: store.storedetails!.status == "Open"
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
                                color: store.storedetails!.status == "Open"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: 500,
                child: model.busy(model.items)
                    ? KBusy()
                    : PageView(
                        controller: model.btmNavigationPageController,
                        children: [
                          ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: KTextFormField(
                                        hint: "Search Products",
                                        onChanged: model.onSearchChanged,
                                      ),
                                    ),
                                    mWidthSpan,
                                    Expanded(
                                      child: KButton(
                                        child: Text("Search"),
                                        onPressed: model.search,
                                        isBusy: model.busy(
                                            model.searchedProductResponse),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              lHeightSpan,
                              SearchedStoreProductView(
                                  items: model.searchedProductResponse.isEmpty
                                      ? model.items
                                      : model.searchedProductResponse)
                            ],
                          ),
                          SearchedMapView(
                            storeName: store.storedetails!.storeName,
                            latitude: store.storedetails!.location[1],
                            longitude: store.storedetails!.location[0],
                          ),
                          SearchedDetailView(
                            description: store.storedetails?.description,
                            deliveryOption: store.storedetails!.deliveryOption,
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
