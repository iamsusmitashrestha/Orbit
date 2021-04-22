import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@injectable
class CategoryViewModel extends BaseViewModel {
  List<String> selectedCategories = [];

  void onSelectionChanged(List<String> value) {
    selectedCategories = value;
  }

  onCategorySave() {}
}
