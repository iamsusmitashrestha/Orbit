import 'package:flutter/material.dart';

class KTimePicker extends StatefulWidget {
  final Function(TimeOfDay) onTimePicked;
  final String? labelText;
  final String? hintText;
  final TimeOfDay? initialTime;
  KTimePicker({
    required this.onTimePicked,
    this.labelText,
    this.hintText,
    this.initialTime,
  });
  @override
  _KTimePickerState createState() => _KTimePickerState();
}

class _KTimePickerState extends State<KTimePicker> {
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      var now = widget.initialTime ?? TimeOfDay.now();

      timeController.text = now.format(context);
      widget.onTimePicked(now);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        // constraints: BoxConstraints.expand(),
        child: TextField(
          controller: timeController,
          enabled: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
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
            context: context,
            initialTime: widget.initialTime ?? TimeOfDay.now());

        if (pickedTime == null) return;

        timeController.text = pickedTime.format(context);

        widget.onTimePicked(pickedTime);
      },
    );
  }
}
