import 'package:flutter/material.dart';

class VniTextFormField extends StatelessWidget {
  final String hintText;
  final String counterText;
  final String errorText;
  final int maxLength;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final TextCapitalization textCapitalization;

  const VniTextFormField({
    Key key,
    @required this.hintText,
    this.counterText,
    this.errorText,
    this.maxLength,
    @required this.controller,
    this.validator,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autofocus: false,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: textCapitalization,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        isDense: true,
        counterText: counterText,
        hintText: hintText,
        errorText: errorText,
        hintStyle: Theme.of(context).textTheme.caption,
        contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        border: OutlineInputBorder(),
      ),
    );
  }
}
