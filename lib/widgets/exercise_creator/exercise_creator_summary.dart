
import 'package:flutter/material.dart';
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
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    draft = Provider.of<ExerciseBloc>(context, listen: false).getDraft();
  }

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
                          Text(StringUtils.difficultyMap[draft.difficulty], style: TextStyle(fontSize: 18, color: StringUtils.difficultyColorMap[draft.difficulty]),),
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
                          Text(draft.category),
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
                        Text(draft.name),
                        SizedBox(height: 10,),
                        Text("Description", style: Theme.of(context).textTheme.subtitle),
                        Text(draft.description),
                        SizedBox(height: 10,),
                        Text("Notes", style: Theme.of(context).textTheme.subtitle),
                        Text(draft.note),

                      ],
                    ),
                  ),
                )
              ],
            ),
            TextField(
              controller: _controller,
              onChanged: (val){

              },
              decoration: InputDecoration(
                  enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                  focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                  hintText: "Three rounds of..."
              ),
            ),
            MaterialButton(
              onPressed: () {
                pickADate(context).then((date){
                  draft.timestamp = date;
                  print(draft.timestamp);
                  Provider.of<ExerciseBloc>(context,listen: false).addExercise(draft);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeekList()),
                  );
                });

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

  Future<DateTime> pickADate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(1970), lastDate: DateTime(2100));

    if(picked != null){
      print(picked);
    }
    return picked;
  }

}
