import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/carousel.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
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
          padding: sPadding,
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
            sHeightSpan,
            SvgPicture.asset(
              "assets/images/inventory.svg",
              height: 180,
              width: 100,
              fit: BoxFit.contain,
            ),
            lHeightSpan,
            KTextFormField(
              hint: "Search Products",
              initialValue: model.search,
              onChanged: model.onSearchChange,
            ),
            mHeightSpan,
            Text(
              "Products Available",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            model.isBusy
                ? KBusy()
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: model.items
                        .where((element) =>
                            model.search.isEmpty ||
                            element.title.contains(model.search))
                        .toList()
                        .length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      ItemModel item = model.items
                          .where((element) =>
                              model.search.isEmpty ||
                              element.title.contains(model.search))
                          .toList()[index];
                      return Card(
                        margin: sPadding,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Carousel(
                              carouselHeight:
                                  MediaQuery.of(context).size.width * 0.3,
                              itemCount: item.image.length,
                              onPageChanged: model.setCarouselIndex,
                              itemBuilder: (BuildContext context, int index) {
                                print(item.image[index]);
                                return Image.network(
                                  item.image[index],
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Center(
                                        child: Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    ));
                                  },
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 50,
                                );
                              },
                              carouselIndex: model.carouselIndex,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: sPadding,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      xsHeightSpan,
                                      // Text("Rs. ${item.price}".toString()),
                                      Text(item.price.toString())
                                      // Image.network(
                                      //     _dio.options.baseUrl + response.data['store']['logo']
                                      // ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    model.busy(index)
                                        ? CircularProgressIndicator()
                                        : IconButton(
                                            color: Colors.red,
                                            icon: Icon(Icons.delete),
                                            onPressed: () => model.showMyDialog(
                                                index, context),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
