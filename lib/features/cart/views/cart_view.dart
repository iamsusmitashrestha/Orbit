import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/cart/view_models/cart_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => locator<CartViewModel>(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("My Cart"),
              actions: [
                Text(
                  "Clear Cart",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/cash.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Carrot",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      xsHeightSpan,
                                      Text(
                                        "Rs. 100",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: model.deleteCart,
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
