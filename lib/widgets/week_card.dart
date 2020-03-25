import 'package:flutter/material.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/screens/day_view.dart';
import 'package:training_journal/screens/week_view.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class WeekCard extends StatelessWidget {
  List<Day> week;
  int weekNumber;

  WeekCard({this.week, this.weekNumber});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: SoftElevatedContainer(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        padding: EdgeInsets.all(16),
        child: Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(minHeight: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  weekNumber == 0 ? "Ongoing" : "Week $weekNumber",
                  style: TextStyle(
                      color: Color(0xFF798DA6),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: week.length < 7 ? MainAxisAlignment.start : MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: week
                        .map((day) => WeekDayBar(
                              day: day,
                            ))
                        .toList()),
              ],
            )),
      ),
    );
  }
}

class WeekDayBar extends StatelessWidget {
  Day day;
  WeekDayBar({this.day});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DayView(day: day)),
          );
        },
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 32,
              height: day.exercises.length == 0
                  ? 0
                  : StringUtils.difficultyHeightMap[day.exercises[0].difficulty],
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      color: day.exercises.length == 0
                          ? Colors.transparent
                          : StringUtils.difficultyColorMapTranslucent[day.exercises[0].difficulty])),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              StringUtils.weekDayMap[day.date.weekday],
              style: TextStyle(fontSize: 20, color: Color(0xFF4F4F4F)),
            )
          ],
        ),
      ),
    );
  }
}
