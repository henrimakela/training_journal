import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/widgets/exercise_list_item.dart';
import 'package:training_journal/widgets/week_card.dart';

class WeekView extends StatefulWidget {
  List<Day> week;
  int weekNumber;

  WeekView({this.week, this.weekNumber});

  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top:8.0, bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                  tag: widget.weekNumber,
                  child: WeekCard(
                    week: widget.week,
                    weekNumber: widget.weekNumber,
                  )),
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: _createExerciseList(widget.week, context)),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createExerciseList(List<Day> week, BuildContext context) {
    List<Widget> list = List();
    week.forEach((day) {
      day.exercises.forEach((e) {
        list.add(
            Dismissible(
              key: UniqueKey(),
              background: Container(
                padding: EdgeInsets.only(right: 10),
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.redAccent,
                child: Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (DismissDirection direction) async {
                final bool res = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                        ),
                        title: Text("Confirm"),
                        content:
                        Text("Are you sure you wish to delete this exercise?", style: Theme.of(context).textTheme.body1,),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Provider.of<ExerciseBloc>(context, listen: false)
                                    .deleteExercise(e);
                                Navigator.of(context).pop(true);
                                setState(() {
                                  day.exercises.remove(e);
                                });
                              },
                              child: Text("DELETE"), textColor: Colors.redAccent,),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text("CANCEL"),
                          )
                        ],
                      );
                    });

                return res;
              },
              child: ExerciseListItem(
          exercise: e,
        ),
            ));
      });
    });

    return list;
  }
}
