import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/carousel.dart';
import 'package:orbit/features/profile/view_models/profile_vm.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
import 'package:stacked/stacked.dart';

class StoreProductView extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    if (model.items.isNotEmpty) {
      return GridView.builder(
          padding: sPadding,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: model.items.length,
          itemBuilder: (context, index) {
            ItemModel item = model.items[index];
            return Card(
              margin: sPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Carousel(
                    carouselHeight: MediaQuery.of(context).size.width * 0.3,
                    itemCount: item.image.length,
                    onPageChanged: model.setCarouselIndex,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        item.image[index],
                        errorBuilder: (BuildContext context, Object exception,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      elWidthSpan,
                    ],
                  ),
                ],
              ),
            );
          });
    }
    return Container();
  }
}
