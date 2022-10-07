// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class AnimationPage extends StatefulWidget {
//   final String lottiePath;
//
//   const AnimationPage({Key? key, required this.lottiePath}) : super(key: key);
//
//   @override
//   _AnimationPageState createState() => _AnimationPageState();
// }
//
// class _AnimationPageState extends State<AnimationPage> {
//   late Timer _timer;
//
//   @override
//   void dispose() {
//     if (_timer.isActive) _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _timer = Timer(Duration(seconds: 3), () => Navigator.of(context).pop(true));
//     return AlertDialog(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       content: Lottie.asset(this.widget.lottiePath),
//     );
//   }
// }
