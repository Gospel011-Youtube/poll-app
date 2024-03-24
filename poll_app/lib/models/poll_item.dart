import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pollitem {
  // option
  final String option;

  // voted
  final bool voted;

  // percentage
  final double percentage;
  
  Pollitem({
    required this.option,
    required this.voted,
    required this.percentage,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'option': option,
      'voted': voted,
      'percentage': percentage,
    };
  }

  factory Pollitem.fromMap(Map<String, dynamic> map) {
    return Pollitem(
      option: map['option'] as String,
      voted: map['voted'] as bool,
      percentage: map['percentage'] as double,
    );
  }


}
