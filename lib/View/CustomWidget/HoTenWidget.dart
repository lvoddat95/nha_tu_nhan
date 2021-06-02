import 'package:flutter/material.dart';

class HoTenWidget extends StatelessWidget {
  const HoTenWidget({Key key, this.errorText, this.controller}) : super(key: key);
  final String errorText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
      autofocus: false,
      maxLength: 20,
      textCapitalization: TextCapitalization.characters,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        isDense: true,
        hintText: "Nhập họ và tên chủ hợp đồng",
        hintStyle: Theme.of(context).textTheme.caption,
        contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        border: OutlineInputBorder(),
      ),
    );
  }
}