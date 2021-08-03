import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserDataService {
  String? storeId;
  String? userId;
  String? logo;
  String? storeName;
  String? address;
  num? phoneNumber;
  String? storeDescription;
  TimeOfDay? closingTime;
  TimeOfDay? openingTime;
  bool? deliveryOption;
  LatLng? location;
  String? hints;

  String? storeStatus;
  List<String> categories = [];
  List<String> paymentMethod = [];
}
