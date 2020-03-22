import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/screens/week_view.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/week_card.dart';

class WeekList extends StatefulWidget {
  @override
  _WeekListState createState() => _WeekListState();
}

class _WeekListState extends State<WeekList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _addExercise();
          },
        ),
        body: StreamBuilder<List<List<Day>>>(
          stream: Provider.of<ExerciseBloc>(context).weekStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Text(
                    "No exercises",
                    style: Theme.of(context).textTheme.title,
                  ),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<Day> week = snapshot.data[index];
                     /* return ListTile(
                          title: Text("${d.date.day}.${d.date.month}.${d.date.year}", style: Theme.of(context).textTheme.subtitle,),
                        subtitle: Text(StringUtils.weekDayMap[d.date.weekday]),
                        trailing: Text(d.exercises.length.toString()),<
                      );*/
                     return Hero(
                       tag: index,
                       child: GestureDetector(
                           onTap: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => WeekView(week: week, weekNumber: index,)),
                             );
                           },
                           child: WeekCard(week: week, weekNumber: index,)),
                     );


                      /*ListTile(
                       title: Text(week.length.toString(), style: Theme.of(context).textTheme.subtitle,),
                      subtitle: Text(week.last.date.toString()),
                      trailing: Text(StringUtils.weekDayMap[week.last.date.weekday]),
                     );*/

                    });
              }
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  _addExercise() {
    var e = Exercise(
        name: "madness",
        category: "weights",
        description: "yolo",
        difficulty: 0.4,
        note: "yopo",
        timestamp: DateTime.now().subtract(Duration(days: 17)));

    print("Timestamp of an exercise about to be saved: " + e.timestamp.toString());

    Provider.of<ExerciseBloc>(context, listen: false).addExercise(e);
  }
}
