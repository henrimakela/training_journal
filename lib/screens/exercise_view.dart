import 'package:flutter/material.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/quarter_circle.dart';
import 'package:training_journal/widgets/quarter_circle_painter.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class ExerciseView extends StatelessWidget {

  Exercise exercise;
  ExerciseView({this.exercise});

  @override
  Widget build(BuildContext context) {

    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: <Widget>[
            SoftElevatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(minHeight: 160),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: QuarterCircle(
                          color: isDarkMode ? StringUtils.difficultyColorMap[exercise.difficulty] : StringUtils
                              .difficultyColorMapTranslucent[exercise.difficulty],
                          circleAlignment: CircleAlignment.topRight,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Text(exercise.name,
                              style: TextStyle(
                                  color: Color(0xFF798DA6),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            exercise.description,
                            style: Theme.of(context).textTheme.body1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SoftElevatedContainer(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(minHeight: 160),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("How was I feeling",
                        style: TextStyle(
                            color: Color(0xFF798DA6),
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      exercise.note,
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
