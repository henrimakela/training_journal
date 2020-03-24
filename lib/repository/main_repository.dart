
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/db/database_helper.dart';

class MainRepository {
  DatabaseHelper _databaseHelper;

  MainRepository(){
    this._databaseHelper = DatabaseHelper();
  }

  Future<List<Exercise>> getExercises(bool ascending) async {
    List<Exercise> exercises = await _databaseHelper.getExercises();
    if (ascending) {
      exercises.sort((a, b) => (b.timestamp.compareTo(a.timestamp)));
    } else {
      exercises.sort((a, b) => (a.timestamp.compareTo(b.timestamp)));
    }

    return exercises;
  }

  //Days starting from the oldest recorded exercise
  //Exercises are wrapped in a Day object because there can be multiple exercises per day!
  Future<List<Day>> getExercisesInDays() async {

    //get exercises from the db
    List<Exercise> exercises = await _databaseHelper.getExercises();

    if(exercises.isEmpty){
      return List();
    }
    //sort exercises to oldest first
    exercises.sort((a, b) => (a.timestamp.compareTo(b.timestamp)));
    DateTime startTime = exercises.first.timestamp;
    if(startTime.weekday != 1){
      startTime = startTime.subtract(Duration(days: startTime.weekday-1));
    }
    DateTime endTime = DateTime.now();
    DateTime startTimeZeroed = DateTime(startTime.year, startTime.month, startTime.day, 0,0,0,0,0);
    DateTime endTimeZeroed = DateTime(endTime.year, endTime.month, endTime.day, 0,0,0,0,0);



    List<Day> dayList = [];

    //generate days for every day since the oldest exercise;
    for(int i = startTimeZeroed.difference(endTimeZeroed).inDays; i <= 0; i++){
      print("Generating days : " + startTimeZeroed.toString());
      Day day = Day(date: startTimeZeroed, exercises: getExercisesWithDate(exercises: exercises, date: startTimeZeroed));
      dayList.add(day);
      startTimeZeroed = startTimeZeroed.add(Duration(days: 1));
    }
    print("Days generated: " + dayList.length.toString());
    dayList.sort((a,b) => (b.date.compareTo(a.date)));
    return dayList;

  }

  List<Exercise> getExercisesWithDate({List<Exercise> exercises, DateTime date}){
    List<Exercise> exeList = [];
    exercises.forEach((e){
      DateTime eTimeZeroed = DateTime(e.timestamp.year, e.timestamp.month, e.timestamp.day, 0,0,0,0,0);
      if(date.difference(eTimeZeroed).inDays == 0){
        print("Day matches with an exercise " + eTimeZeroed.toString() + " " + date.toString());
        exeList.add(e);
      }
    });

    return exeList;
  }


  Future<List<List<Day>>> getWeeks() async {

    List<Day> days = await getExercisesInDays();
    List<List<Day>> weeks = List();

    //sort oldest first
    days.sort((a,b) => (a.date.compareTo(b.date)));
    List<Day> week = List();
    for(int i = 0; i < days.length; i++){

      week.add(days[i]);
      if(days[i].date.weekday == 7){
        weeks.add(List.from(week));
        week.clear();
      }
      //if we get to the last item in the list and its not 7
      else if(i == days.length -1){
        weeks.add(List.from(week));
        week.clear();
      }
    }

    print("Weeks overall: " + weeks.length.toString());

    weeks.forEach((w){
      print("Week day count" + w.length.toString());
    });


    return weeks.reversed.toList();
  }

  Future<bool> addExercise(Exercise e) async {
    var id = await _databaseHelper.addExercise(e);
    if(id != null){
      return true;

    }
    return  false;
  }

  Future<int> deleteExercise(Exercise e) async {
    return await _databaseHelper.deleteExercise(e);
  }

  Future<int> updateExercise(Exercise e) async {
    return await _databaseHelper.updateExercise(e);
  }

  Future<int> addRecurring(Exercise e, int schedule ) async {
    return await _databaseHelper.addRecurring(e.id, e.timestamp, schedule);
  }
}
