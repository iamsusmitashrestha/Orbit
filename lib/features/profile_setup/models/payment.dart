class PaymentModel {
  final String value;
  final String image;

  PaymentModel(this.value, this.image);

  PaymentModel.fromJson(Map<String, dynamic> parsedJson, String base_url)
      : value = parsedJson['value'],
        image = base_url + parsedJson['image'].split('../public')[1];
}
