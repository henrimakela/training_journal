import 'package:rxdart/rxdart.dart';
import 'package:training_journal/bloc/bloc.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/repository/main_repository.dart';

class ExerciseBloc extends Bloc {
  MainRepository repository;

  ExerciseBloc({this.repository}) {
    _loadWeeks();
  }

  final _dayController = BehaviorSubject<List<Day>>();
  final _weekController = BehaviorSubject<List<List<Day>>>();

  Stream<List<Day>> get dayStream => _dayController.stream;

  Stream<List<List<Day>>> get weekStream => _weekController.stream;

  _loadWeeks() {
    repository.getWeeks().then((weeks) {
      _weekController.sink.add(weeks);
    }, onError: (e) {
      print(e.toString());
    });
  }

  _loadDays() {
    /*repository.getExercises(ascending).then((exercises) {
      _exerciseController.sink.add(exercises);
    }, onError: (e){
      print(e.toString());
    });*/

    repository.getExercisesInDays().then((days) {
      _dayController.sink.add(days);
    }, onError: (e) {
      print(e.toString());
    });
  }

  updateExercise(Exercise e) {
    repository.updateExercise(e).then((value) {
      //refresh stream
      _loadDays();
    }, onError: (e) {
      print(e.toString());
    });
  }

  deleteExercise(Exercise e) {
    repository.deleteExercise(e).then((value) {
      //refresh stream
      _loadDays();
    }, onError: (e) {
      print(e.toString());
    });
  }

  addExercise(Exercise e) {
    repository.addExercise(e).then((value) {
      //resfresh stream
      _loadDays();
    }, onError: (e) {
      print(e.toString());
    });
  }

  @override
  void dispose() {
    _dayController.close();
    _weekController.close();
  }
}
