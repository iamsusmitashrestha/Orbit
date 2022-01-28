class ItemModel {
  final String id;
  final String title;
  final num price;
  // final List<XFile> image;

  ItemModel(
    this.title,
    this.price,
    this.id,
    // this.image,
  );

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        id = parsedJson['_id'],
        price = parsedJson['price'];
  // image = base_url+parsedJson['image'];
}
