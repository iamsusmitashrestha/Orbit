import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/widgets/k_chip.dart';

class MultiSelectItem<T> {
  final T data;
  final bool selected;

  MultiSelectItem(this.data, {this.selected = false});
}

class KMultiSelectChipField<T> extends StatefulWidget {
  final List<T> items;
  final List<T> selected;

  final void Function(List<T>) onSelectionChanged;

  KMultiSelectChipField(
      {required this.items,
      required this.selected,
      required this.onSelectionChanged});

  @override
  _KMultiSelectChipFieldState<T> createState() =>
      _KMultiSelectChipFieldState<T>(selected);
}

class _KMultiSelectChipFieldState<T> extends State<KMultiSelectChipField<T>> {
  List<T> selectedList;

  _KMultiSelectChipFieldState(List<T> selected) : selectedList = selected;

  @override
  void initState() {
    super.initState();
  }

  void toggleSelection(T item) {
    int selectedIndex = selectedList.indexOf(item);

    if (selectedIndex == -1) {
      setState(() {
        selectedList.add(item);
      });
    } else {
      setState(() {
        selectedList.removeAt(selectedIndex);
      });
    }
    widget.onSelectionChanged(selectedList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: AppDimens.MULTI_SELECT_SPACING,
        spacing: AppDimens.MULTI_SELECT_SPACING,
        children: this
            .widget
            .items
            .map(
              (e) => KChip(
                text: e.toString(),
                variant: ChipVariant.FILLED,
                selected: widget.selected.contains(e),
                onPressed: () {
                  toggleSelection(e);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
