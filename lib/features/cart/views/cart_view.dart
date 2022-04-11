import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
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
              ),
              body: ListView(
                padding: sPadding,
                children: [
                  model.isBusy
                      ? KBusy()
                      : TextButton(
                          onPressed: model.clearCart,
                          child: Text(
                            "Clear Cart",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                  for (var key in model.cart.keys)
                    ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        Card(
                          color: LIGHT_PRIMARY_COLOR,
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
                                for (var product in model.cart[key])
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
                                                  Image.asset(
                                                    "assets/images/cash.png",
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        product["productName"],
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      xsHeightSpan,
                                                      Wrap(
                                                        children: [
                                                          Text(
                                                            "NPR " +
                                                                product["price"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(" x "),
                                                          Text(
                                                            product["quantity"]
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(" = "),
                                                          Text(
                                                            "NPR " +
                                                                (product["quantity"] *
                                                                        product[
                                                                            "price"])
                                                                    .toString(),
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              model.busy(
                                                      model.cart["productId"])
                                                  ? KBusy()
                                                  : IconButton(
                                                      onPressed: () {
                                                        model.deleteCart(
                                                            product[
                                                                "productId"]);
                                                      },
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
                                  ),
                                mHeightSpan,
                                Wrap(
                                  children: [
                                    Text("Grand Total: ",
                                        style: TextStyle(fontSize: 18)),
                                    Text(
                                        "NPR " +
                                            (model.cart[key] as List)
                                                .fold<num>(
                                                    0.0,
                                                    (previousValue, element) =>
                                                        previousValue +
                                                        ((element['quantity'] *
                                                                element[
                                                                    'price'])
                                                            as num))
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                mHeightSpan,
                                KButton(
                                    child: Text("Place Order"),
                                    onPressed: () {
                                      model.order(
                                          key,
                                          (model.cart[key] as List)
                                              .fold<num>(
                                                  0.0,
                                                  (previousValue, element) =>
                                                      previousValue +
                                                      ((element['quantity'] *
                                                              element['price'])
                                                          as num))
                                              .toString());
                                    }),
                              ],
                            ),
                          ),
                        ),
                        elHeightSpan,
                      ],
                    ),
                ],
              ),
            ));
  }
}
