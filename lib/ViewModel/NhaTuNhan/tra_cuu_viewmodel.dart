import 'package:flutter/material.dart';
import 'package:nha_tu_nhan/Helper/APIManager.dart';
import 'package:nha_tu_nhan/Helper/Utility.dart';
import 'package:nha_tu_nhan/Model/validator_model.dart';
import '../../View/NhaTuNhan/thong_tin_tra_cuu.dart';
import '../../main.dart';

class TraCuuViewModel with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BuildContext context = navigatorKey.currentContext;

  final TextEditingController maSoHopDongController = TextEditingController();
  final TextEditingController hoTenController = TextEditingController();

  String maSoHopDongHintText = "Nhập mã số hợp đồng";
  String hoTenHintText = "Nhập họ và tên chủ hợp đồng";

  bool showPhuongThucTraCuu = false;
  bool showTraCuuBangMaHopDong = false;

  int loaiHinhBaoHiemIndex = -1;
  int phuongThucTraCuuIndex = -1;

  String loaiHinhBaoHiemHintext = "Chọn loại hình bảo hiểm";
  String phuongThucTraCuuHintText = "Chọn phương thức tra cứu";

  final List<String> _loaiHingBaoHiemData = [
    'TNDS bắt buộc ô tô',
    'TNDS bắt buộc xe máy / xe điện',
    'Bảo hiểm nhà tư nhân'
  ];
  final List<String> _phuongThucTraCuuData = [
    'Tra cứu bằng Mã số hợp đồng',
  ];

  ValidatorModel _maSoHopDongValidator = ValidatorModel('', null);
  ValidatorModel _hotenValidator = ValidatorModel('', null);

  ValidatorModel get getHotenValidator => _hotenValidator;
  ValidatorModel get getMaSoHopDongValidator => _maSoHopDongValidator;

  bool enableBtnXacNhan = false;

  showAlertDialogLoaiHinhBaoHiem() async {
    int position = await Utility.showAlertDialog(
      context,
      "Chọn loại hình bảo hiểm",
      _loaiHingBaoHiemData,
      loaiHinhBaoHiemIndex,
    );

    loaiHinhBaoHiemIndex = position;
    loaiHinhBaoHiemHintext = _loaiHingBaoHiemData[position];

    if (loaiHinhBaoHiemIndex == 2) {
      showPhuongThucTraCuu = true;
    } else {
      showPhuongThucTraCuu = false;
    }

    if (!showPhuongThucTraCuu) {
      showTraCuuBangMaHopDong = false;
      phuongThucTraCuuIndex = -1;
      phuongThucTraCuuHintText = "Chọn phương thức tra cứu";
    }
    notifyListeners();
  }

  showAlertDialogPhuongThucTraCuu() async {
    int position = await Utility.showAlertDialog(
      context,
      "Chọn phương thức tra cứu",
      _phuongThucTraCuuData,
      phuongThucTraCuuIndex,
    );
    phuongThucTraCuuIndex = position;
    phuongThucTraCuuHintText = _phuongThucTraCuuData[position];
    if (phuongThucTraCuuIndex == 0) {
      showTraCuuBangMaHopDong = true;
    } else {
      showTraCuuBangMaHopDong = false;
    }
    notifyListeners();
  }

  void validateMaSoHopDong(String value) {
    if (value == null || value.isEmpty) {
      _maSoHopDongValidator =
          ValidatorModel(value, '\u26A0 Thông tin bắt buộc.');
    } else {
      _maSoHopDongValidator = ValidatorModel(value, null);
    }
    notifyListeners();
    validateBtnXacNhan();
  }

  void validateHoTen(String value) {
    if (value == null || value.isEmpty) {
      _hotenValidator = ValidatorModel(value, '\u26A0 Thông tin bắt buộc.');
    } else {
      _hotenValidator = ValidatorModel(value, null);
    }
    validateBtnXacNhan();
    notifyListeners();
  }

  // String validatorMaSoHopDong(String value){
  //   if (value == null || value.isEmpty) {
  //     _maSoHopDongValidator = ValidatorModel(value, '\u26A0 Thông tin bắt buộc.');
  //   }else{
  //     _maSoHopDongValidator = ValidatorModel(value, null);
  //   }
  //   return _maSoHopDongValidator.error;
  // }
  //
  // String validatorHoTen(String value){
  //   if (value == null || value.isEmpty) {
  //     _hotenValidator = ValidatorModel(value, '\u26A0 Thông tin bắt buộc.');
  //   }else{
  //     _hotenValidator = ValidatorModel(value, null);
  //   }
  //   return _hotenValidator.error;
  // }

  void validateBtnXacNhan() {
    if (showPhuongThucTraCuu) {
      if (_maSoHopDongValidator.value.length > 0 &&  _hotenValidator.value.length > 0) {
        enableBtnXacNhan = true;
      } else {
        enableBtnXacNhan = false;
      }
    } else {}
    notifyListeners();
  }

  void validateForm() {
    String pMaSoHopDong = '4101800080/B05';
    String pHoTen = 'Nguyễn Thị Thúy Hằng';

    if (showPhuongThucTraCuu && showTraCuuBangMaHopDong) {
      APIManager.apiTraCuuNhaTuNhan(2, 0, pMaSoHopDong, pHoTen);
    } else {
      print('Form is valid');
    }
    notifyListeners();
  }
}
