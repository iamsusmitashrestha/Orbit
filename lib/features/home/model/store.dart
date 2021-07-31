class StoreModel {
  StoreDetailsModel? storedetails;
  String? calculatedDistance;

  StoreModel({this.storedetails, this.calculatedDistance});

  StoreModel.fromJson(Map<String, dynamic> json) {
    storedetails = json['storedetails'] != null
        ? new StoreDetailsModel.fromJson(json['storedetails'])
        : null;
    calculatedDistance = (json['calculatedDistance'] / 1000).toStringAsFixed(1);
  }
}

class StoreDetailsModel {
  bool? deliveryOption;
  String? status;
  List<num> location;
  String? sId;
  String? storeName;
  String? address;
  String? owner;
  String logo;

  StoreDetailsModel(
      {this.deliveryOption,
      this.status,
      required this.location,
      this.sId,
      this.storeName,
      this.address,
      this.owner,
      required this.logo});

  StoreDetailsModel.fromJson(Map<String, dynamic> json)
      : deliveryOption = json['deliveryOption'],
        status = json['storeStatus'],
        location = List<num>.from(json['location']),
        sId = json['_id'],
        storeName = json['storeName'],
        address = json['address'],
        owner = json['owner'],
        logo = json['logo'] ?? "";
}
