import 'package:flutter/material.dart';
import 'package:poll_app/models/poll_model.dart';
import 'package:poll_app/widgets/my_poll_item.dart';


class MyPollWidget extends StatefulWidget {
  const MyPollWidget({super.key, required this.poll});

  final Poll poll;

  @override
  State<MyPollWidget> createState() => _MyPollWidgetState();
}

class _MyPollWidgetState extends State<MyPollWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // text
          Text(
            widget.poll.text,
            style: const TextStyle(fontSize: 18),
          ),

          // poll options
          ...List<Widget>.generate(widget.poll.pollitems.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: GestureDetector(
                onTap: () {
                  vote(index);
                },
                child: PollitemWidget(
                  item: widget.poll.pollitems[index],
                ),
              ),
            );
          }),

          // total votes
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("${widget.poll.totalVotes} votes"),
            ],
          )
        ],
      ),
    );
  }

  void vote(int index) {
    Map<String, dynamic> pollOption = widget.poll.options[index];

    if (pollOption['voted'] == true) {
      pollOption['votes'] -= 1;
    } else {
      // remove previous vote

      removePreviousVote();

      // vote
      pollOption['votes'] += 1;
    }

    pollOption['voted'] = !pollOption['voted'];

    setState(() {});
  }

  void removePreviousVote() {
    for (var option in widget.poll.options) {
      if (option['voted'] == true) {
        option['votes'] -= 1;
        option['voted'] = false;
      }
    }
  }
}
