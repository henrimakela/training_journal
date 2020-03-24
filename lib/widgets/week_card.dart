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

  var difficultyColorMap = {
    0.0: Color(0xFF41DDB5),
    0.2: Color(0xFFAAEEB3),
    0.4: Color(0xFFFFD166),
    0.6: Color(0xFFFF5F58),
    0.8: Color(0xFFFB362D),
    1.0: Color(0xFFFF0B00)
  };

  var difficultyHeightMap = {
    0.0: 40.0,
    0.2: 60.0,
    0.4: 80.0,
    0.6: 100.0,
    0.8: 120.0,
    1.0: 140.0
  };

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
                  : difficultyHeightMap[day.exercises[0].difficulty],
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      color: day.exercises.length == 0
                          ? Colors.transparent
                          : difficultyColorMap[day.exercises[0].difficulty])),
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
