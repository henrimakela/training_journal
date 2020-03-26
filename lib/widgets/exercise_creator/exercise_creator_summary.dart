import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/bloc/exercise_creator_bloc.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/screens/week_list.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class ExerciseCreatorSummary extends StatefulWidget {
  @override
  _ExerciseCreatorSummaryState createState() => _ExerciseCreatorSummaryState();
}

class _ExerciseCreatorSummaryState extends State<ExerciseCreatorSummary> {
  Exercise draft;
  @override
  void initState() {
    super.initState();
    draft = Provider.of<ExerciseBloc>(context, listen: false).getDraft();
    draft.timestamp = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            Text(
              "Here's the summary of your training session",
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 100,
                      child: SoftElevatedContainer(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Difficulty",
                                style: Theme.of(context).textTheme.subtitle),
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      StringUtils.difficultyColorMapTranslucent[
                                          draft.difficulty]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 110,
                      width: 100,
                      child: SoftElevatedContainer(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Category",
                                style: Theme.of(context).textTheme.subtitle),
                            Text(draft.category,
                                style: TextStyle(
                                    color: Color(0xFF828282),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SoftElevatedContainer(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.all(0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Name",
                              style: Theme.of(context).textTheme.subtitle),
                          SizedBox(
                            height: 8,
                          ),
                          Text(draft.name,
                              style: TextStyle(
                                  color: Color(0xFF828282),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Description",
                              style: Theme.of(context).textTheme.subtitle),
                          SizedBox(
                            height: 8,
                          ),
                          Text(draft.description,
                              style: TextStyle(
                                  color: Color(0xFF828282),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Notes",
                              style: Theme.of(context).textTheme.subtitle),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            draft.note,
                            style: TextStyle(
                                color: Color(0xFF828282),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 0.2,
                endIndent: 0.8,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  "Add timestamp",
                  style: Theme.of(context).textTheme.title,
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Theme.of(context).accentColor,),
                  onPressed: () {
                    pickADate(context).then((date) {
                      setState(() {
                        draft.timestamp = date;
                      });
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "If you did this exercise earlier, you can provide the date and time manually. Otherwise the exercise will be saved with the current date"),

            SizedBox(
              height: 10,
            ),
            Text(DateFormat("dd.MM.yyyy").format(draft.timestamp),  style: Theme.of(context).textTheme.subtitle,),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 0.2,
                endIndent: 0.8,
                color: Colors.grey[300],
              ),
            ),

            SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
                  Provider.of<ExerciseBloc>(context, listen: false)
                      .addExercise(draft);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeekList()),
                  );
              },
              elevation: 0,
              textColor: Colors.white,
              color: Color(0xFF41DDB5),
              shape: Theme.of(context).buttonTheme.shape,
              minWidth: Theme.of(context).buttonTheme.minWidth,
              height: Theme.of(context).buttonTheme.height,
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }

  Future<DateTime> pickADate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1));

    if (picked != null) {
      print(picked);
    }
    return picked;
  }
}
