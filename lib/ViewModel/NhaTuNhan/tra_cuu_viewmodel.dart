import 'package:flutter/material.dart';
import 'package:nha_tu_nhan/Helper/Utility.dart';
import '../../View/NhaTuNhan/thong_tin_tra_cuu.dart';
import '../../main.dart';

class TraCuuViewModel with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController maSoHopDongController = TextEditingController();
  final TextEditingController hoTenController = TextEditingController();
  bool formInvalid = false;
  String maSoHopDongErrorText = "\u26A0 Thông tin bắt buộc.";
  String hoTenErrorText = "\u26A0 Thông tin bắt buộc.";

  String maSoHopDongPlaceholder = "Nhập mã số hợp đồng";
  String hoTenPlaceholder = "Nhập họ và tên chủ hợp đồng";

  bool showPhuongThucTraCuu = true;
  bool showTraCuuBangMaHopDong = true;

  String loaiHinhBaoHiemPlaceholder = "Chọn loại hình bảo hiểm 1";
  int _loaiHinhBaoHiemIndex = 0;
  final List<String> _loaiHingBaoHiemData = [
    'TNDS bắt buộc ô tô',
    'TNDS bắt buộc xe máy / xe điện',
    'Bảo hiểm nhà tư nhân'
  ];


  String phuongThucTraCuuLabel = "Chọn phương thức tra cứu";
  int _phuongThucTraCuuIndex = -1;
  final List<String> _phuongThucTraCuuData = [
    'Tra cứu bằng Mã số hợp đồng',
    'Tra cứu bằng QR Code',
  ];


  BuildContext context = navigatorKey.currentContext;

  void validateForm() {
    formInvalid = formKey.currentState.validate();

    if (formKey.currentState.validate()) {
      print(formKey.currentState.validate());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThongTinTraCuu(),
          ));
    } else {
      print('Form is valid $formInvalid');
    }
    notifyListeners();
  }

  showAlertDialogLoaiHinhBaoHiem() async {
    int position = await Utility.showAlertDialog(
      navigatorKey.currentContext,
      "Chọn loại hình bảo hiểm",
      _loaiHingBaoHiemData,
      _loaiHinhBaoHiemIndex,
    );
    _loaiHinhBaoHiemIndex = position;
    print('viewmodel position $position');
    loaiHinhBaoHiemPlaceholder = _loaiHingBaoHiemData[position];
    if (_loaiHinhBaoHiemIndex == 2) {
      showPhuongThucTraCuu = true;
    }
    print('viewmodel _loaiHinhBaoHiemIndex $_loaiHinhBaoHiemIndex');

    notifyListeners();
  }

  showAlertDialogPhuongThucTraCuu() async {
    int position = await Utility.showAlertDialog(
      context,
      "Chọn phương thức tra cứu",
      _phuongThucTraCuuData,
      _phuongThucTraCuuIndex,
    );
    _phuongThucTraCuuIndex = position;
    phuongThucTraCuuLabel = _phuongThucTraCuuData[position];
    if (_phuongThucTraCuuIndex == 0) {
      showTraCuuBangMaHopDong = true;
    }
    notifyListeners();
  }








}
