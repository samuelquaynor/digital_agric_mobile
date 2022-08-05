import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer(
      {required this.height,
      required this.width,
      required this.child,
      this.padding});
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      decoration:  BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
