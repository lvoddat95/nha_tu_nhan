import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:nha_tu_nhan/Helper/APIManager.dart';

int indigo700 = 0xFF0303F9F;
int indigo500 = 0xFF03F51B5;

Map PostBodyAPI(Map body) {
  if (body != null) {
    var _body = json.encode(body);

    String _key = md5.convert(utf8.encode((APIManager.key + _body))).toString();

    body["vni_SecureHash"] = _key;

    return body;
  }
  return null;
}

String GenKey(Map body) {
  if (body != null) {
    var _body = json.encode(body);
    String _key = md5.convert(utf8.encode((APIManager.key + _body))).toString();
    return _key;
  }
  return null;
}

String getOs() {
  if (Platform.isIOS) {
    return 'ios'; // unique ID on iOS
  } else {
    return 'android'; // unique ID on Android
  }
}

String tokenAcess = 'tokenAcess';
String tokenRefresh = 'tokenRefresh';
