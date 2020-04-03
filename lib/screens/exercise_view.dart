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
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[

            SoftElevatedContainer(
              padding: EdgeInsets.only(bottom: 20, top: 16, left: 16, right: 16),
              child: ListTile(
                title: Text(
                  "Title",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).accentColor : Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(exercise.name, style: Theme.of(context).textTheme.body1),
                )
                ,
              ),
            ),
            SizedBox(height: 32,),
            SoftElevatedContainer(
              padding: EdgeInsets.only(bottom: 20, top: 16, left: 16, right: 16),
              child: ListTile(
                title: Text(
                  "Difficulty",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).accentColor : Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(StringUtils.difficultyMap[exercise.difficulty], style: Theme.of(context).textTheme.body1),
                )
                ,
              ),
            ),
            SizedBox(height: 32,),
            SoftElevatedContainer(
              padding: EdgeInsets.only(bottom: 20, top: 16, left: 16, right: 16),
              child: ListTile(
                title: Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).accentColor : Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(exercise.description, style: Theme.of(context).textTheme.body1),
                )
                ,
              ),
            ),
            SizedBox(height: 32,),
            SoftElevatedContainer(
              padding: EdgeInsets.only(bottom: 20, top: 16, left: 16, right: 16),
              child: ListTile(
                title: Text(
                  "Note to self",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Theme.of(context).accentColor : Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. I", style: Theme.of(context).textTheme.body1),
                )
                ,
              ),
            )
           /* Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Theme.of(context).accentColor : Colors.black,
                    shape: BoxShape.circle
                  ),
                ),
                SizedBox(width: 20,),

                Text(
                  "Title",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 32,),
                Text(exercise.name, style: Theme.of(context).textTheme.body1)
              ],
            ),
            SizedBox(
              height: 32,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: isDarkMode ? Theme.of(context).accentColor : Colors.black,
                      shape: BoxShape.circle
                  ),
                ),
                SizedBox(width: 20,),

                Text(
                  "Difficulty",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 32,),
                Text(StringUtils.difficultyMap[exercise.difficulty], style: Theme.of(context).textTheme.body1)
              ],
            ),
            SizedBox(
              height: 32,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                  color: isDarkMode ? Theme.of(context).accentColor : Colors.black,
                  shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 20,),

            Text(
              "Description",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 32,),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 32),
                      child: Text(exercise.description, style: Theme.of(context).textTheme.body1)),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                  color: isDarkMode ? Theme.of(context).accentColor : Colors.black,
                  shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 20,),

            Text(
              "Note to self",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 32,),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 32),
                      child: Text(exercise.note, style: Theme.of(context).textTheme.body1,)),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
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
            )*/
          ],
        ),
      ),
    );
  }
}
