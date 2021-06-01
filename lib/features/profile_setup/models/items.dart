class ItemModel {
  final String id;
  final String title;
  final num price;

  ItemModel(
    this.title,
    this.price,
    this.id,
  );

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        id = parsedJson['_id'],
        price = parsedJson['price'];
}
