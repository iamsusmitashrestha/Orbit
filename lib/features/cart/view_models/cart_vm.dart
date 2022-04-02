import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class CartViewModel extends BaseViewModel {
  final Dio dio;
  final NavigationService navigationService;

  CartViewModel({required this.dio, required this.navigationService});

  initialise() {}

  getCart() async {
    setBusy(true);
    try {
      var response = dio.get("");
    } catch (e) {}
  }

  deleteCart() async {}
}
