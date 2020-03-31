import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/exercise_creator/circle_painter.dart';
import 'package:training_journal/widgets/quarter_circle.dart';
import 'package:training_journal/widgets/quarter_circle_painter.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class ExerciseListItem extends StatelessWidget {
  Exercise exercise;

  ExerciseListItem({this.exercise});

  @override
  Widget build(BuildContext context) {

    return SoftElevatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              height: 64,
              width: 64,
              child: QuarterCircle(
                color: StringUtils
                    .difficultyColorMapTranslucent[exercise.difficulty],
                circleAlignment: CircleAlignment.topRight,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    exercise.name,
                    style: TextStyle(
                        color: Color(0xFF798DA6),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12,),
                  Text(
                      exercise.description,
                      style: Theme.of(context).textTheme.body1
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      endIndent: 2,
                      indent: 0.2,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    exercise.note,
                    style: Theme.of(context).textTheme.body1
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        exercise.category,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          Text(
                            StringUtils.weekDayMap[exercise.timestamp.weekday],
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            formatDateString(exercise.timestamp),
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )

              /*ListTile(

              title: Text(
                exercise.name,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(StringUtils.weekDayMap[exercise.timestamp.weekday], style: Theme.of(context).textTheme.subtitle,),
                  Text(exercise.note,style: TextStyle(color: Colors.black),)
                ],
              ),
            ),*/
              ),
        ],
      ),
    );
  }

  String formatDateString(DateTime date){
    var format = DateFormat("dd.MM.yyyy");
    return format.format(date);
  }
}
