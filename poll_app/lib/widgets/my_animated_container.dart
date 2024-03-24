import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatelessWidget {
  const MyAnimatedContainer({super.key, this.color, this.percentage = 1});

  final Color? color;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width - 32;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: percentage * maxWidth,
      height: 48,
      decoration: BoxDecoration(
          color: color ?? Colors.grey, borderRadius: BorderRadius.circular(8)),
    );
  }
}
