class SearchedStoreModel {
  bool? deliveryOption;
  String? storeStatus;
  List<num> location;
  String? createdAt;
  String? sId;
  String? storeName;
  String? address;
  String? logo;
  String? hints;

  SearchedStoreModel(
      {this.deliveryOption,
      this.storeStatus,
      required this.location,
      this.createdAt,
      this.sId,
      this.storeName,
      this.address,
      this.logo,
      this.hints});

  SearchedStoreModel.fromJson(Map<String, dynamic> json)
      : deliveryOption = json['deliveryOption'],
        storeStatus = json['storeStatus'],
        location = List<num>.from(json['location']),
        storeName = json['storeName'],
        address = json['address'],
        logo = json['logo'],
        hints = json['hints'];
}
