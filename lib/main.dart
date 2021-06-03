import 'package:flutter/material.dart';
import 'package:nha_tu_nhan/ViewModel/NhaTuNhan/tra_cuu_viewmodel.dart';
import 'package:provider/provider.dart';
import 'View/NhaTuNhan/tra_cuu.dart';

final navigatorKey = GlobalKey<NavigatorState>();

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TraCuuViewModel(),
        )
      ],
      child: MaterialApp(
        home: TraCuu(title: 'Tra cứu giấy chứng nhận'),
        navigatorKey: navigatorKey,
      ),
    );
  }
}

