import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/features/profile_setup/view_models/store_profile_vm.dart';
import 'package:orbit/features/profile_setup/widgets/profile_container.dart';
import 'package:stacked/stacked.dart';

class StoreProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreProfileViewModel>.reactive(
        viewModelBuilder: () => locator<StoreProfileViewModel>(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Card(
                          elevation: 10,
                          child: Image.asset(
                            "assets/images/store.jpg",
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          color: Colors.black54,
                          height: 210,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 80,
                          left: 4,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  model.userDataService.logo!,
                                  loadingBuilder:
                                      (context, child, loadingProgress) =>
                                          loadingProgress == null
                                              ? child
                                              : Container(
                                                  width: 40,
                                                  height: 40,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                  width: 55,
                                  height: 55,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              sWidthSpan,
                              Column(
                                children: [
                                  Text(
                                    model.userDataService.storeName!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1.4,
                                    ),
                                  ),
                                  Text(
                                    model.userDataService.phoneNumber
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      // fontWeight: FontWeight.w500,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ListTile(
                      onTap: model.logOut,
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text("Logout"),
                    ),
                    ListTile(
                      onTap: model.goToHomeView,
                      leading: Icon(
                        Icons.store,
                        color: Colors.black,
                      ),
                      title: Text("View Stores Around"),
                    ),
                    ListTile(
                      onTap: model.deleteStore,
                      leading: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      title: Text("Delete My Store"),
                    ),
                  ],
                ),
              ),
            ),
            body: ListView(
              padding: AppDimens.PAGE_PADDING,
              children: [
                mHeightSpan,
                Row(
                  children: [
                    InkWell(
                      onTap: model.updateLogo,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          model.userDataService.logo!,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : Container(
                                      width: 40,
                                      height: 40,
                                      child: CircularProgressIndicator(),
                                    ),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    sWidthSpan,
                    Column(
                      children: [
                        Text(
                          model.userDataService.storeName!,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          model.userDataService.address!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                elHeightSpan,
                model.isBusy
                    ? KBusy()
                    : ElevatedButton(
                        child: Text(
                          model.storeStatus ? "OPEN" : "CLOSE",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:
                              model.storeStatus ? Colors.green : Colors.red,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(16),
                          ),
                          padding: mYPadding,
                        ),
                        onPressed: model.postStoreStatus,
                      ),
                lHeightSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: model.goToInventory,
                      child: buildProfileContainer(context, "Inventory", "",
                          false, "inventory-icon.svg"),
                    ),
                    InkWell(
                      onTap: model.goToStoreDetails,
                      child: buildProfileContainer(
                          context, "Store", "Details", true, "details.svg"),
                    ),
                  ],
                ),
                sHeightSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: model.goToPaymentMethod,
                      child: buildProfileContainer(
                          context, "Payment", "Methods", true, "payment.svg"),
                    ),
                    InkWell(
                      onTap: model.goToCategories,
                      child: buildProfileContainer(
                          context, "Categories", "", false, "categories.svg"),
                    ),
                  ],
                ),
                KButton(
                    child: Text("View Orders"),
                    onPressed: () {
                      model.navigationService
                          .navigateTo(Routes.storeOrderViewRoute);
                    }),
              ],
            ),
          );
        });
  }
}
