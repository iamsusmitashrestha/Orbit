import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/inventory_vm.dart';
import 'package:orbit/features/profile_setup/views/add_item_view.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class InventoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InventoryViewModel>.reactive(
      viewModelBuilder: () => locator<InventoryViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddItemView(),
              ),
            );
          },
          // onPressed: model.addItem,
          backgroundColor: PRIMARY_COLOR,
        ),
        body: ListView(
          padding: sPagePadding,
          children: [
            sHeightSpan,
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back),
                onPressed: model.goToStoreProfile,
              ),
            ),
            mHeightSpan,
            SvgPicture.asset(
              "assets/images/inventory.svg",
              height: 220,
              width: 100,
              fit: BoxFit.contain,
            ),
            lHeightSpan,
            Text(
              "Inventory",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            lHeightSpan,
            model.isBusy
                ? KBusy()
                : ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    padding: sPagePadding,
                    itemCount: 1,
                    // itemCount: model.items.length,
                    separatorBuilder: (context, index) => sHeightSpan,
                    itemBuilder: (context, index) {
                      // ItemModel item = model.items[index];
                      return Card(
                        margin: sPadding,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Carrot",
                                    // item.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  xsHeightSpan,
                                  // Text("Rs. ${item.price}".toString()),
                                  Text("100")
                                  // Image.network(
                                  //     _dio.options.baseUrl + response.data['store']['logo']
                                  // ),
                                ],
                              ),
                              elWidthSpan,
                              Row(
                                children: [
                                  model.busy(index)
                                      ? CircularProgressIndicator()
                                      : IconButton(
                                          color: Colors.red,
                                          icon: Icon(Icons.delete),
                                          onPressed: () =>
                                              model.deleteItem(index),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
