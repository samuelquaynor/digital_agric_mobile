import 'package:flutter/material.dart';

class PhotoButton extends StatefulWidget {
  const PhotoButton({required this.onTap});
  final void Function() onTap;

  @override
  _PhotoButtonState createState() => _PhotoButtonState();
}

class _PhotoButtonState extends State<PhotoButton> {
  double innerDiameter = 0;
  double margin = 35;
  double opacity = 0.5;

  void _setInitialValues() {
    innerDiameter = 0.0;
    margin = 35.0;
    opacity = 0.5;
    setState(() {});
  }

  void _setFinalValues() {
    innerDiameter = 74.0;
    margin = 2.0;
    opacity = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) {
          _setFinalValues();
        },
        onTapUp: (_) {
          _setInitialValues();
        },
        onTapCancel: () {
          _setInitialValues();
          widget.onTap();
        },
        child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 74, minWidth: 74),
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  border: Border.all(width: 2),
                ),
                child: AnimatedContainer(
                    height: innerDiameter,
                    width: innerDiameter,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.all(margin),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(opacity),
                        shape: BoxShape.circle)))));
  }
}
