// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nha_tu_nhan/ViewModel/NhaTuNhan/TraCuuViewModel.dart';
import 'package:provider/provider.dart';
import 'View/NhaTuNhan/TraCuu.dart';

void main() {
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
      ),
    );
  }
}

// class MyModel with ChangeNotifier{
//   String text = "Hello";
//   void doSomething() {
//     text = "Wold";
//     notifyListeners();
//   }
// }

// class MyApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<MyModel>(
//       create: (context) => MyModel(),
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(title: Text('My App')),
//           backgroundColor: Colors.grey,
//           body: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 color: Colors.green[200],
//                 child: Consumer<MyModel>(
//                   builder: (context, mymodel, child) {
//                     return RaisedButton(
//                       child: Text('Do something'),
//                       onPressed: () {
//                         Provider.of<MyModel>(context, listen: false).doSomething();
//                       },
//                     );
//                   },
//                 ),
//               ),
//
//               Container(
//                 padding: const EdgeInsets.all(35),
//                 color: Colors.blue[200],
//                 child: Consumer<MyModel>(
//                   builder: (context, mymodel, child) {
//                     return Text(mymodel.text);
//                   },
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
