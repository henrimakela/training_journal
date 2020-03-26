import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/exercise_list_item.dart';

class DayView extends StatelessWidget {
  Day day;

  DayView({this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringUtils.weekDayMap[day.date.weekday] +
              " " +
              DateFormat("dd.MM.yyyy").format(day.date), style: TextStyle(fontSize: 18, color: Color(0xFFBDBDBD), fontWeight: FontWeight.bold),),
        ),
        body: ListView.builder(
            itemCount: day.exercises.length,
            itemBuilder: (context, index) {
          return ExerciseListItem(exercise:  day.exercises[index],);
        }));
  }
}
