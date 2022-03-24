class ItemModel {
  final String id;
  final String title;
  final int price;
  final List<String> image;

  ItemModel(
    this.title,
    this.price,
    this.id,
    this.image,
  );

  ItemModel.fromJson(Map<String, dynamic> parsedJson, String base_url)
      : title = parsedJson['title'],
        id = parsedJson['_id'],
        price = parsedJson['price'],
        image = parsedJson['image']
            .map<String>((image) => base_url + image)
            .toList();
}
