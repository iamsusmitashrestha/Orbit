import 'package:orbit/common/constants/ui_helpers.dart';

import 'package:flutter/material.dart';

class KTimePicker extends StatefulWidget {
  final Function(TimeOfDay) onTimePicked;
  final String? labelText;
  final String? hintText;
  KTimePicker({required this.onTimePicked, this.labelText, this.hintText});
  @override
  _KTimePickerState createState() => _KTimePickerState();
}

class _KTimePickerState extends State<KTimePicker> {
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      var now = TimeOfDay.now();
      timeController.text = now.format(context);
      widget.onTimePicked(now);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: TextField(
          controller: timeController,
          enabled: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: Icon(Icons.timer),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.black26,
              ),
            ),
          ),
        ),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        TimeOfDay? pickedTime = await showTimePicker(
            context: context, initialTime: TimeOfDay.now());

        if (pickedTime == null) return;

        timeController.text = pickedTime.format(context);

        widget.onTimePicked(pickedTime);
      },
    );
  }
}
