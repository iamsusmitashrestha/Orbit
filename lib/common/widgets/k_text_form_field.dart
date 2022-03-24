import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/themes/app_themes.dart';

class KTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(dynamic)? onChanged;
  final TextEditingController? controller;
  final String? hint;
  final String? initialValue;
  final String? label;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;

  KTextFormField(
      {this.validator,
      this.onChanged,
      this.hint,
      this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.controller,
      this.initialValue});

  @override
  _KTextFormFieldState createState() =>
      _KTextFormFieldState(obscureText: obscureText);
}

class _KTextFormFieldState extends State<KTextFormField> {
  /// Since custom positioning of default error message was not possible,
  /// this new errorText state variable was created to custom show the validation
  String? errorText;

  /// A checkmark is need to be shown in the TextFormField once the interaction has started
  /// and the validation is error free. This boolean state variable keeps track of whether the interaction has begun or not
  bool interacted = false;

  /// Obscure Text is used for passwords.
  /// This variable needs to be toggled whenever, show/hide state of password is to be toggled.
  bool obscureText;

  _KTextFormFieldState({required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.label != null)
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label!,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              sHeightSpan,
            ],
          ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: obscureText,
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hint,

            /// For passwords, we need a toggle icon instead of the checkmark,
            /// so we show the toggle buttons as a first priority, then the checkmark.
            suffixIcon: widget.obscureText
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: DARK_GREY,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  )
                : interacted && errorText == null
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
            errorStyle: TextStyle(
              height: 0,
              fontSize: 0,
            ),
            enabledBorder: (interacted && errorText == null)
                ? Theme.of(context).inputDecorationTheme.focusedBorder
                : null,
          ),
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          /// Since, default styling for the errorText was not appropriate,
          /// the validator is called manually inside of onChanged and the state variables are updated.
          onChanged: (value) {
            if (widget.validator != null) {
              setState(() {
                errorText = widget.validator!(value);
                interacted = true;
              });
            }

            widget.onChanged?.call(value);
          },
        ),
        if (errorText != null)
          Column(
            children: [
              sHeightSpan,
              Text(
                errorText ?? "",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Theme.of(context).errorColor,
                    ),
              ),
            ],
          )
      ],
    );
  }
}
