import 'package:flutter/material.dart';

/// Top Container
class TopContainer extends StatelessWidget {
  /// Constructor
  const TopContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      this.padding});

  /// Top Container height
  final double height;

  /// Top Container width
  final double width;

  /// Top Container child
  final Widget child;

  /// Top Container padding
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
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
