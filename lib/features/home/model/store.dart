class StoreModel {
  StoreDetailsModel? storedetails;
  String? calculatedDistance;
  num? contactNumber;

  StoreModel({this.storedetails, this.calculatedDistance, this.contactNumber});

  StoreModel.fromJson(Map<String, dynamic> json) {
    storedetails = json['storedetails'] != null
        ? new StoreDetailsModel.fromJson(json['storedetails'])
        : null;
    contactNumber = json['ContactNumber'];
    calculatedDistance = (json['calculatedDistance'] / 1000).toStringAsFixed(1);
  }
}

class StoreDetailsModel {
  bool deliveryOption;
  String status;
  List<num> location;
  String? sId;
  String storeName;
  String address;
  String? owner;
  String logo;
  String? description;
  String? hints;
  String? openingTime;
  String? closingTime;
  List<String>? paymentMethod;

  StoreDetailsModel({
    this.deliveryOption = false,
    this.status = "Open",
    required this.location,
    this.sId,
    required this.storeName,
    required this.address,
    this.owner,
    required this.logo,
    this.description,
    this.openingTime,
    this.closingTime,
    this.hints,
    this.paymentMethod,
  });

  StoreDetailsModel.fromJson(Map<String, dynamic> json)
      : deliveryOption = json['deliveryOption'],
        status = json['storeStatus'],
        location = List<num>.from(json['location']),
        sId = json['_id'],
        storeName = json['storeName'],
        address = json['address'],
        owner = json['owner'],
        logo = "https://orbit1.herokuapp.com" + json['logo'],
        description = json['description'],
        openingTime = json['openingTime'],
        closingTime = json['closingTime'],
        hints = json['hints'],
        paymentMethod = List<String>.from(json['paymentMethod']);
}
