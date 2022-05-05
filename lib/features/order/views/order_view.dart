import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_headline.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/order/view_models/order_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.reactive(
      viewModelBuilder: () => locator<OrderViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("My Orders"),
        ),
        body: ListView(
          padding: mPadding,
          children: [
            model.isBusy ? KBusy() : Container(),
            for (var order in model.orders)
              ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  Card(
                    color:
                        order.shipped ? Colors.green[200] : Colors.orange[200],
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: [
                          Wrap(
                            children: [
                              KHeadline("ORDER ID: "),
                              KHeadline(order.id),
                            ],
                          ),
                          xsHeightSpan,
                          Wrap(
                            children: [
                              KHeadline("Order Status: "),
                              KHeadline(order.shipped ? "Shipped" : "Pending"),
                            ],
                          ),
                          xsHeightSpan,
                          for (var item in order.items)
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(
                                              item.product.image.isNotEmpty
                                                  ? item.product.image[0]
                                                  : "",
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return Image.asset(
                                                  "assets/images/cash.png",
                                                  height: 100,
                                                  width: 100,
                                                );
                                              },
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.product.title,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                xsHeightSpan,
                                                Wrap(
                                                  children: [
                                                    Text(
                                                      "NPR " +
                                                          item.product.price
                                                              .toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(" x "),
                                                    Text(
                                                      item.quantity.toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(" = "),
                                                    Text(
                                                      "NPR " +
                                                          (item.quantity *
                                                                  item.product
                                                                      .price)
                                                              .toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          mHeightSpan,
                          Wrap(
                            children: [
                              Text("Grand Total: ",
                                  style: TextStyle(fontSize: 18)),
                              Text(
                                  "NPR " +
                                      order.items
                                          .fold<num>(
                                              0.0,
                                              (previousValue, element) =>
                                                  previousValue +
                                                  (element.quantity *
                                                      element.product.price))
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  sHeightSpan,
                ],
              ),
          ],
        ),
      ),
    );
  }
}
