import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nha_tu_nhan/Helper/CustomAnimation.dart';
import 'package:nha_tu_nhan/ViewModel/NhaTuNhan/tra_cuu_viewmodel.dart';
import 'package:provider/provider.dart';
import 'View/NhaTuNhan/tra_cuu.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Color(0xFF00819D)
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true
    ..customAnimation = CustomAnimation();
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
        builder: EasyLoading.init(),
      ),
    );
  }
}
