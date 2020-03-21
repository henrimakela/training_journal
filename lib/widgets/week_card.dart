import 'package:flutter/material.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class WeekCard extends StatelessWidget {
  List<Day> week;

  WeekCard({this.week});

  @override
  Widget build(BuildContext context) {
    return SoftElevatedContainer(
      margin: 8,
      padding: 16,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(minHeight: 200),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: week
                  .map((day) => WeekDayBar(
                        day: day,
                      ))
                  .toList())),
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
    0.0: 40,
    0.2: 60,
    0.4: 80,
    0.6: 100,
    0.8: 120,
    1.0: 140
  };



  WeekDayBar({this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 32,
          height: 60,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: Colors.greenAccent)),
        ),
        Text(day.date.day.toString() + "." + day.date.month.toString()),
        Text(StringUtils.weekDayMap[day.date.weekday])
      ],
    );
  }
}
