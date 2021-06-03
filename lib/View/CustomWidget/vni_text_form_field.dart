import 'package:flutter/material.dart';

class VniTextFormField extends StatelessWidget {
  final String errorMessage;
  final String placeholder;
  final String counterText;
  final TextEditingController controller;
  final int maxLength;

  const VniTextFormField({
    Key key,
    @required this.controller,
    @required this.placeholder,
    @required this.maxLength,
    this.errorMessage,
    this.counterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      autofocus: false,
      maxLength: maxLength,
      textCapitalization: TextCapitalization.characters,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        isDense: true,
        counterText: counterText,
        hintText: placeholder,
        hintStyle: Theme.of(context).textTheme.caption,
        contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        border: OutlineInputBorder(),
      ),
    );
  }
}
