import 'package:flutter/material.dart';
import 'View/NhaTuNhan/TraCuu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TraCuu(title: 'Tra cứu giấy chứng nhận'),
    );
  }
}

