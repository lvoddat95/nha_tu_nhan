import 'package:flutter/material.dart';
import '../../View/NhaTuNhan/thong_tin_tra_cuu.dart';
import '../../main.dart';

class TraCuuViewModel with ChangeNotifier {
  final TextEditingController maSoHopDongController = TextEditingController();
  final TextEditingController hoTenController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BuildContext context = navigatorKey.currentContext;

  void validateForm() {
    if (formKey.currentState.validate()) {

      print(formKey.currentState.validate());

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThongTinTraCuu(),
          ));
    } else {
      print('Form is valid');
    }

    notifyListeners();
  }
}
