
import 'package:flutter/material.dart';
import 'package:training_journal/data_classes/day.dart';

class DayView extends StatelessWidget {
  Day day;

  DayView({this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(child: Text(day.date.toString()),),
      ),
    );
  }
}
