// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  double height;
  double width;
  Color color;

  PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.height,
    required this.width,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: color,
            ),
            onPressed: onPressed,
            child: child,
          ),
        ),
      );
}
