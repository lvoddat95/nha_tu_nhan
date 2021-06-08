import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nha_tu_nhan/Helper/Utility.dart';
import 'package:nha_tu_nhan/View/NhaTuNhan/thong_tin_tra_cuu.dart';
import 'package:nha_tu_nhan/View/Utils.dart' as UT;

import '../main.dart';
import 'AppString.dart';

class APIManager{
  static final String key = "VNICLIENT";
  static final String baseURL = 'https://ebhhk.com.vn/Tools/APIMobile.aspx';
  static final String baseURLPayment = 'https://ebhhk.com.vn/thanh-toan-app.html';
  static final String baseURLNhaTuNhan = 'http://api-app.bhhk.vn:8088/Tools/APIMobile.aspx';

  static BuildContext _context = navigatorKey.currentContext;

  static Future<dynamic> apiTraCuuNhaTuNhan(
      int p_loai_bao_hiem,
      int p_tra_cuu,
      String p_ma_tra_cuu,
      String p_ho_ten

      )async{
    EasyLoading.show();
    Map _body = {
      "cmd":"tracuugcnntn",
      "p_loai_bao_hiem":p_loai_bao_hiem,
      "p_tra_cuu":p_tra_cuu,
      "p_ma_tra_cuu":p_ma_tra_cuu,
      "p_val":p_ho_ten,
    };
    String _key = UT.GenKey(_body);
    _body['vni_SecureHash'] = _key;
    var _encode_body = json.encode(_body);
    var jsonResponse;
    var res = await http.post(baseURLNhaTuNhan, body: _encode_body);
    if (res.statusCode == 200) {
      // if(res.body != null){

      final objectBody = jsonDecode(res.body);
        String statusCode = objectBody['ResponseCode'];
        switch (statusCode) {
          case '00':
            jsonResponse = json.decode(res.body);
            print(jsonResponse);
            final _data = jsonDecode(jsonResponse["Data"]);
            EasyLoading.dismiss();
            Navigator.push(navigatorKey.currentContext,
                MaterialPageRoute(builder: (context) {
                  return ThongTinTraCuu();
                }));
            print('_data ${_data}');
            break;
          case '-404':
            EasyLoading.dismiss();
            print("hệ thống yêu cầu phương thức post");
            break;
          case '-99':
            EasyLoading.dismiss();
            print("Tham số truyền đi không hợp lệ");
            break;
          case '01':
            EasyLoading.dismiss();
            Utility.showDialogOneButton(navigatorKey.currentContext,
                title: AppString.titleDialogKhongTimThayThongTin,
                content: AppString.contentDialogKhongTimThayThongTin,
                okBtnFunction: () => Navigator.pop(navigatorKey.currentContext));
            break;

            default:
              break;
        }
      // }

    }else if(res.statusCode != 200){
      EasyLoading.dismiss();
      SnackBar(content: Text("Lỗi kết nối đến Server [${res.statusCode}]"));
    }
    EasyLoading.dismiss();

  }

}