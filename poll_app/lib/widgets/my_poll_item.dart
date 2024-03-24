
import 'package:flutter/material.dart';

import 'package:poll_app/models/poll_item.dart';
import 'package:poll_app/widgets/my_animated_container.dart';

class PollitemWidget extends StatelessWidget {
  const PollitemWidget({super.key, required this.item});

  final Pollitem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            MyAnimatedContainer(
              color: Colors.grey.shade300,
            ),
          ],
        ),

        Row(
          children: [
            MyAnimatedContainer(
              color: item.voted == true ? Colors.blueGrey.shade400 : Colors.grey,
              percentage: item.percentage,
            ),
          ],
        ),

        //? option
        Positioned(
          left: 16,
          child: Text(item.option, style: const TextStyle(fontSize: 16),)),

        //? percentaget
        Positioned(
          right: 16,
          child: Text('${(item.percentage * 100).toStringAsFixed(1)}%', style: const TextStyle(fontSize: 16),)),
      ],
    );
  }
}
