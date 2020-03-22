
import 'package:flutter/material.dart';
import 'package:training_journal/widgets/exercise_creator/category_card.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class ExerciseCreatorSummary extends StatefulWidget {
  @override
  _ExerciseCreatorSummaryState createState() => _ExerciseCreatorSummaryState();
}

class _ExerciseCreatorSummaryState extends State<ExerciseCreatorSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Here's the summary of your training session", style: Theme.of(context).textTheme.title,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SoftElevatedContainer(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Difficulty", style: Theme.of(context).textTheme.subtitle),
                          SizedBox(height: 20,),
                          Text("EASY", style: TextStyle(fontSize: 18, color: Theme.of(context).accentColor),),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    SoftElevatedContainer(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.all(0),
                      child: Column(
                        children: <Widget>[
                          Text("Category", style: Theme.of(context).textTheme.subtitle),
                          SizedBox(height: 20,),
                          Text("Weights"),
                          SizedBox(height: 20,),
                        ],
                      ),
                    )
                  ],
                ),
                SoftElevatedContainer(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(0),
                  child: Container(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name", style: Theme.of(context).textTheme.subtitle),
                        Text("Chest & arms"),
                        SizedBox(height: 10,),
                        Text("Description", style: Theme.of(context).textTheme.subtitle),
                        Text("4x6x90kg bench press, dips, bicep curl"),
                        SizedBox(height: 10,),
                        Text("Notes", style: Theme.of(context).textTheme.subtitle),
                        Text("Felt good. First time to do 4 sets of bench with 90kg without  help."),

                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
