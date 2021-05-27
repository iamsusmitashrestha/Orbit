class CategoryModel {
  final String value;
  final String label;

  CategoryModel(this.value, this.label);

  CategoryModel.fromJson(Map<String, dynamic> parsedJson)
      : value = parsedJson['value'],
        label = parsedJson['label'];

  @override
  String toString() {
    return label;
  }
}
