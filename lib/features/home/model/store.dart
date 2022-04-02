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
      : deliveryOption = json['store']['deliveryOption'],
        status = json['store']['storeStatus'],
        location = List<num>.from(json['store']['location']),
        sId = json['store']['_id'],
        storeName = json['store']['storeName'],
        address = json['store']['address'],
        owner = json['store']['owner'],
        logo = "https://orbit1.herokuapp.com" + json['store']['logo'],
        description = json['store']['description'],
        openingTime = json['store']['openingTime'],
        closingTime = json['store']['closingTime'],
        hints = json['store']['hints'],
        paymentMethod = List<String>.from(json['store']['paymentMethod']);
}
