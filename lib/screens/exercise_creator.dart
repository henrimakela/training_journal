
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:training_journal/widgets/exercise_creator/add_description.dart';
import 'package:training_journal/widgets/exercise_creator/add_name.dart';
import 'package:training_journal/widgets/exercise_creator/add_note.dart';
import 'package:training_journal/widgets/exercise_creator/category_card.dart';
import 'package:training_journal/widgets/exercise_creator/category_selector.dart';
import 'package:training_journal/widgets/exercise_creator/circle_painter.dart';
import 'package:training_journal/widgets/exercise_creator/difficulty_selector.dart';
import 'package:training_journal/widgets/exercise_creator/exercise_creator_summary.dart';
import 'package:training_journal/widgets/exercise_creator/step_progress_indicator.dart';

class ExerciseCreator extends StatefulWidget {
  @override
  _ExerciseCreatorState createState() => _ExerciseCreatorState();
}

class _ExerciseCreatorState extends State<ExerciseCreator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: TabBarView(
        children: <Widget>[
          ExerciseCreatorSummary(),
          CategorySelector(),
          DifficultySelector(),
          AddDescription(),
          AddNote(),
          AddName()
        ],
      )
    );
  }
}
