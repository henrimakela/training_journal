import 'package:flutter/material.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/widgets/exercise_list_item.dart';
import 'package:training_journal/widgets/week_card.dart';

class WeekView extends StatelessWidget {
  List<Day> week;
  int weekNumber;

  WeekView({this.week, this.weekNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top:8.0, bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                  tag: weekNumber,
                  child: WeekCard(
                    week: week,
                    weekNumber: weekNumber,
                  )),
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: _createExerciseList(week)),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createExerciseList(List<Day> week) {
    List<Widget> list = List();
    week.forEach((day) {
      day.exercises.forEach((e) {
        list.add(ExerciseListItem(
          exercise: e,
        ));
      });
    });

    return list;
  }
}
