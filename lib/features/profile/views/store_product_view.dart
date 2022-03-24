import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/features/profile/view_models/profile_vm.dart';
import 'package:stacked/stacked.dart';

class StoreProductView extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    if (model.items.isNotEmpty) {
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "List of Items Available",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              // itemCount: model.items.length,
              // separatorBuilder: (context, index) => sHeightSpan,
              itemBuilder: (context, index) {
                // ItemModel item = model.items[index];
                return Card(
                  margin: sPadding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/images/store.jpg"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: sPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
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
                                Text("RS. 100")
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
              }),
        ],
      );
    }
    return Container();
  }
}
