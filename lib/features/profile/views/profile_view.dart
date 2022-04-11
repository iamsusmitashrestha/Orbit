import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/home/model/store.dart';
import 'package:orbit/features/profile/view_models/profile_vm.dart';
import 'package:orbit/features/profile/views/profile_map_view.dart';
import 'package:orbit/features/profile/views/store_product_view.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';
import 'btm_navigation_view.dart';
import 'details_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoreModel store =
        ModalRoute.of(context)!.settings.arguments as StoreModel;

    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => locator<ProfileViewModel>(),
      onModelReady: (model) => model.initialise(store),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BtmNavigationView(),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
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
                        Icon(Icons.location_on, color: Colors.white),
                        sWidthSpan,
                        Text(
                          "${store.calculatedDistance!} km away",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    xsHeightSpan,
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
                child: model.isBusy
                    ? KBusy()
                    : PageView(
                        controller: model.btmNavigationPageController,
                        children: [
                          StoreProductView(),
                          ProfileMapView(
                            storeName: store.storedetails!.storeName,
                            latitude: store.storedetails!.location[1],
                            longitude: store.storedetails!.location[0],
                          ),
                          // LocationView(),
                          DetailView(
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
