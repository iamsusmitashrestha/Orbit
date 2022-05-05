import 'package:dio/dio.dart';
import 'package:orbit/core/di/injection.dart';

class OrderModel {
  late String id;
  late String storeId;
  late bool shipped;
  late List<CartModel> items;
  late CustomerModel customer;

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    storeId = json['storeId'];
    shipped = json['shipped'] != null ? json['shipped'] : false;
    items = (json['products'] as List)
        .map<CartModel>((e) => CartModel.fromJson(e))
        .toList();
    customer = CustomerModel.fromJson(json['customer']);
  }
}

class CustomerModel {
  late String email;
  late String userId;

  CustomerModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userId = json['userId'];
  }
}

class CartModel {
  late String id;
  late num quantity;
  late ProductModel product;

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }
}

class ProductModel {
  late List<String> image;
  late String id;
  late String title;
  late num price;
  late String store;
  late String owner;

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = (json['image'] as List)
        .map<String>((e) => locator<Dio>().options.baseUrl + e)
        .toList();
    id = json['_id'];
    title = json['title'];
    price = json['price'];
    store = json['store'];
    owner = json['owner'];
  }
}
