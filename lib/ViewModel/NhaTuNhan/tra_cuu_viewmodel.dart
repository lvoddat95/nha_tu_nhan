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

  String loaiHinhBaoHiemHintext = "Chọn loại hình bảo hiểm";
  int loaiHinhBaoHiemIndex = -1;
  final List<String> _loaiHingBaoHiemData = [
    'TNDS bắt buộc ô tô',
    'TNDS bắt buộc xe máy / xe điện',
    'Bảo hiểm nhà tư nhân'
  ];

  String phuongThucTraCuuHintText = "Chọn phương thức tra cứu";
  int phuongThucTraCuuIndex = -1;
  final List<String> _phuongThucTraCuuData = [
    'Tra cứu bằng Mã số hợp đồng',
    // 'Tra cứu bằng QR Code',
  ];

  bool formValid = false;

  ValidatorModel _maSoHopDongValidator = ValidatorModel('', null);
  ValidatorModel get maSoHopDongValidator => _maSoHopDongValidator;

  ValidatorModel _hotenValidator = ValidatorModel('', null);
  ValidatorModel get hotenValidator => _hotenValidator;


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
    }else{
      showPhuongThucTraCuu = false;
    }

    if (!showPhuongThucTraCuu){
      showTraCuuBangMaHopDong = false;
      phuongThucTraCuuIndex = -1;
      phuongThucTraCuuHintText = "Chọn phương thức tra cứu";
    }
    print('showAlertDialogLoaiHinhBaoHiem $showPhuongThucTraCuu');
    print('showAlertDialogPhuongThucTraCuu $showTraCuuBangMaHopDong');
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
    }else{
      showTraCuuBangMaHopDong = false;
    }
    notifyListeners();
  }

  String validateMaSoHopDong(String value){
      if (value == null || value.isEmpty) {
        _maSoHopDongValidator = ValidatorModel(value, '\u26A0 Thông tin bắt buộc.');
      }else{
        _maSoHopDongValidator = ValidatorModel(value, null);
      }
      return _maSoHopDongValidator.error;
  }

  String validateHoTen(String value){
    if (value == null || value.isEmpty) {
      _hotenValidator = ValidatorModel(value, '\u26A0 Thông tin bắt buộc.');
    }else{
      _hotenValidator = ValidatorModel(value, null);
    }
    return _hotenValidator.error;
  }

  void validateForm() {
    if(showPhuongThucTraCuu && showTraCuuBangMaHopDong){
      formValid = formKey.currentState.validate();
      String pMaSoHopDong = '4101800081/B05';
      String pHoTen = 'Nguyễn Thị Thúy Hằng';
      if (formValid) {
       APIManager.apiTraCuuNhaTuNhan(2, 0, pMaSoHopDong, pHoTen);

      } else {
        print('Form is valid $formValid');
      }

    }

    notifyListeners();

  }





}
