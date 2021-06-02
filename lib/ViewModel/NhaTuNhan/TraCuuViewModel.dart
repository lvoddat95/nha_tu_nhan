import 'package:flutter/material.dart';

class TraCuuViewModel with ChangeNotifier{

  final TextEditingController maSoHopDongController = TextEditingController();
  final TextEditingController hoTenController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState.validate()) {
      print(formKey.currentState.validate());
    } else {
      print('Form is valid');
    }
    notifyListeners();
  }


}
