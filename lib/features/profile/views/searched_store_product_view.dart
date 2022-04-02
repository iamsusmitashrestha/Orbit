import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/carousel.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/features/profile/view_models/searched_profile_vm.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
import 'package:stacked/stacked.dart';

class SearchedStoreProductView
    extends ViewModelWidget<SearchedProfileViewModel> {
  final List<ItemModel> items;
  SearchedStoreProductView({required this.items});
  @override
  Widget build(BuildContext context, SearchedProfileViewModel model) {
    if (items.isNotEmpty) {
      return GridView.count(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          children: items.map((item) {
            return Card(
              margin: sPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    Carousel(
                      carouselHeight: 155,
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
                              Text(item.price.toString())
                            ],
                          ),
                        ),
                        elWidthSpan,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: KButton(
                        isBusy: model.busy(item),
                        child: Text("Add to Cart"),
                        onPressed: () {
                          model.addToCart(item);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList());
    }
    return Container();
  }
}
