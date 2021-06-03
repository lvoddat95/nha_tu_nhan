import 'package:flutter/material.dart';

class MaSoHopDongWidget extends StatelessWidget {
  const MaSoHopDongWidget({  Key key, this.errorText , this.controller}) : super(key: key);
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
      maxLength: 200,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        isDense: true,
        hintText: "Nhập mã số hợp đồng",
        counterText: "",
        hintStyle: Theme.of(context).textTheme.caption,
        contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        border: OutlineInputBorder(),
      ),
    );
  }
}