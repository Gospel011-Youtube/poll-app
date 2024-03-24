import 'package:flutter/material.dart';
import 'package:poll_app/data_source/poll_source.dart';
import 'package:poll_app/models/poll_model.dart';
import 'package:poll_app/widgets/my_poll_item.dart';
import 'package:poll_app/widgets/my_poll_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Poll get poll => Poll.fromMap(PollSource.pollData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyPollWidget(poll: poll),
          ],
        ),
      ),
    );
  }
}
