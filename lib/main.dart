import 'dart:async';

import 'package:awesome_snack_bar/router/router.dart';
import 'package:awesome_snack_bar/views/recording_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'views/view.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: RecordingButtonView(),
    );
  }
}

//
// class View extends StatefulWidget {
//   const View({Key? key}) : super(key: key);
//
//   @override
//   State<View> createState() => _ViewState();
// }
//
// class _ViewState extends State<View>  with SingleTickerProviderStateMixin {
//
//   late AnimationController controller;
//   late Animation<double> animation;
//
//   @override
//   void initState() {
//     controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this)..addListener(() => setState(() {}));
//     animation = Tween(begin: 0.0, end: 50.0).animate(controller);
//     super.initState();
//   }
//
//
//   int counter = 1;
//
//   bool update = true;
//
//   Offset offset = Offset(0, 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Show Dialog Message'),
//           onPressed: (){
//             CoolAlert.show(
//               context: MagicRouter.currentContext,
//               type: CoolAlertType.loading,
//               backgroundColor: Colors.blueAccent,
//               confirmBtnColor: Colors.blueAccent,
//               confirmBtnText: 'OK',
//               text: "Your transaction was successful!",
//             );
//           },
//         ),
//       )
//     );
//   }
// }
