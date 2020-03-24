
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/bloc/exercise_creator_bloc.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/widgets/exercise_creator/add_description.dart';
import 'package:training_journal/widgets/exercise_creator/add_name.dart';
import 'package:training_journal/widgets/exercise_creator/add_note.dart';
import 'package:training_journal/widgets/exercise_creator/category_selector.dart';
import 'package:training_journal/widgets/exercise_creator/difficulty_selector.dart';
import 'package:training_journal/widgets/exercise_creator/exercise_creator_summary.dart';

class ExerciseCreator extends StatefulWidget {
  @override
  _ExerciseCreatorState createState() => _ExerciseCreatorState();
}

class _ExerciseCreatorState extends State<ExerciseCreator> {
  Exercise exercise;

  @override
  void initState() {
    exercise = Exercise(
        name: "",
        description: "",
        note: "",
        category: "",
        difficulty: 0.0,
        timestamp: DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: TabBarView(
          children: <Widget>[
            //ExerciseCreatorSummary(),
            CategorySelector(onCategorySelected: (cat) {
              exercise.category = cat;
            }),
            DifficultySelector(
              onDifficultySelected: (dif) {
                exercise.difficulty = dif;
              },
            ),
            AddDescription(onDescriptionChanged: (desc) {
              exercise.description = desc;
            }),
            AddNote(onNoteChanged: (note) {
              exercise.note = note;
            }),
            AddName(
                onNameChanged: (name) {
              exercise.name = name;
            },
            onFinish: (){
              Provider.of<ExerciseBloc>(context,listen: false).saveDraft(exercise);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExerciseCreatorSummary()),
              );
            }
            )
          ],
        ));
  }
}
