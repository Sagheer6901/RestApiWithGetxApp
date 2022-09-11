
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/splashscreen_controller.dart';
import 'package:untitled1/constants.dart';




class Splash_Screen extends StatelessWidget {

  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: contentColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark
          //color set to transperent or set your own color
        )
    );

    return Container(
        color: contentColor,
        child: Center(
          child: Image.asset("assets/images/logo.jpeg"),
        ));
  }
}














// class Splash_Screen extends StatefulWidget {
//   const Splash_Screen({Key? key}) : super(key: key);
//
//   @override
//   State<Splash_Screen> createState() => _Splash_ScreenState();
// }
//
// class _Splash_ScreenState extends State<Splash_Screen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 3),
//             () => Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => Login())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//       SystemChrome.setSystemUIOverlayStyle(
//           SystemUiOverlayStyle(
//               statusBarColor: contentColor,
//             statusBarBrightness: Brightness.light,
//             statusBarIconBrightness: Brightness.dark
//             //color set to transperent or set your own color
//           )
//       );
//
//     return Container(
//         color: contentColor,
//         child: Center(
//           child: Image.asset("assets/images/logo.jpeg"),
//         ));
//   }
// }
