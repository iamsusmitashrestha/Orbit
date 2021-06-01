import 'package:flutter/material.dart';

class KTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  KTextButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(14.0),
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
