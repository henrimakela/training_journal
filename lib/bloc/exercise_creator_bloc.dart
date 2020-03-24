import 'package:training_journal/bloc/bloc.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/repository/main_repository.dart';

class ExerciseCreatorBloc extends Bloc{

  MainRepository repository;
  Exercise exercise;
  ExerciseCreatorBloc({this.repository});

  saveExercise(Exercise exercise){
    repository.addExercise(exercise);
  }

  saveDraft(Exercise e){
    this.exercise = e;
  }

  Exercise getDraft(){
    return this.exercise;
  }

  @override
  void dispose() {

  }
}