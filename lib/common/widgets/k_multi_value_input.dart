import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_chip.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';

class KMultiValueInput extends StatefulWidget {
  final List<String> intialList;
  final String? hint;
  final void Function(List<String>) onDataChanged;

  KMultiValueInput(
      {required this.intialList, required this.onDataChanged, this.hint});

  @override
  _KMultiValueInputState createState() => _KMultiValueInputState(intialList);
}

class _KMultiValueInputState extends State<KMultiValueInput> {
  List<String> data;
  final _controller = TextEditingController();

  _KMultiValueInputState(List<String> initalList) : data = initalList;

  void addNewItem() {
    String newItem = _controller.text.trim();
    if (newItem.isEmpty) return;
    setState(() {
      data.add(toBeginningOfSentenceCase(newItem)!);
    });
    _controller.clear();
    widget.onDataChanged(data);
  }

  void removeItem(String item) {
    setState(() {
      data.remove(item);
    });
    widget.onDataChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: KTextFormField(
                keyboardType: TextInputType.name,
                label: "",
                controller: _controller,
                hint: widget.hint,
              ),
            ),
            mWidthSpan,
            KButton(
              child: Icon(Icons.add),
              size: ButtonSize.LARGE,
              onPressed: addNewItem,
            ),
          ],
        ),
        mHeightSpan,
        Wrap(
          runSpacing: AppDimens.MULTI_SELECT_SPACING,
          spacing: AppDimens.MULTI_SELECT_SPACING,
          children: data
              .map((e) => KChip(
                    text: e,
                    variant: ChipVariant.BORDERED,
                    selected: true,
                    removable: true,
                    onPressed: () => removeItem(e),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
