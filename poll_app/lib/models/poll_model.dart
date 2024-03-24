// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:poll_app/models/poll_item.dart';

class Poll {
  // text
  final String text;

  // Map<String, dynamic> options
  final List<Map<String, dynamic>> options;

  Poll({
    required this.text,
    required this.options,
  });

  //*GETTERS

  int get totalVotes {
    int votes = 0;

    for (var option in options) {
      votes += option['votes'] as int;
    }

    return votes;
  }

  List<Pollitem> get pollitems {
    return List<Pollitem>.from(options.map((option) {
      option['percentage'] = getPollPercentage(option['votes']);

      return Pollitem.fromMap(option);
    }));
  }

  //* METHODS
  double getPollPercentage(num votes) {
    return votes == 0 ? 0 : votes / totalVotes;
  }


  //* json serialization

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'options': options,
    };
  }

  factory Poll.fromMap(Map<String, dynamic> map) {
    return Poll(
      text: map['text'] as String,
      options: List<Map<String, dynamic>>.from((map['options'] as List<dynamic>).map<Map<String, dynamic>>((x) => x,),),
    );
  }

  
}
