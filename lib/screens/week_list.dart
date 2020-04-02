import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/screens/new_exercise_screen.dart';
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
          backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
          child: Icon(
            Icons.add,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            _addExercise();
          },
        ),
        body: StreamBuilder<List<List<Day>>>(
          stream: Provider.of<ExerciseBloc>(context).weekStream,
          initialData: List<List<Day>>(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Text(
                    "Get your training journal started by adding a session",
                    textAlign: TextAlign.center,
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewExerciseScreen()),
    );
  }
}
