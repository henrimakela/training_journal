import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/db/database_helper.dart';

void main() {
  test("getTableNames should return future list of strings", () async {
    var mockDBHelper = MockDBHelper();
    when(mockDBHelper.getTableNames())
        .thenAnswer((_) async => Future.value(["", ""]));
    var names = mockDBHelper.getTableNames();

    assert(names is Future<List<String>>);
  });

  group("getExercises", () {
    test("should return a list of exercises", () async {
      var mockDBHelper = MockDBHelper();

      Future<List<Exercise>> exercises = Future.value([
        Exercise(
            id: 1,
            name: "madness",
            category: "weights",
            description: "yolo",
            note: "yopo",
            timestamp: DateTime.now()),
        Exercise(
            id: 2,
            name: "madness",
            category: "weights",
            description: "yolo",
            note: "yopo",
            timestamp: DateTime.now())
      ]);

      when(mockDBHelper.getExercises()).thenAnswer((_) => exercises);

      expect(mockDBHelper.getExercises(),  exercises);
      verify(mockDBHelper.getExercises());
    });
  });

  group("deleteExercise", (){

    var e = Exercise(
        id: 1,
        name: "madness",
        category: "weights",
        description: "yolo",
        note: "yopo",
        timestamp: DateTime.now());

    var mockDbHeler = MockDBHelper();

    test("should return number of rows affected", () async {

      Future<int> rowCount = Future.value(1);

      when(mockDbHeler.deleteExercise(e)).thenAnswer((_) => rowCount);

      expect(mockDbHeler.deleteExercise(e), rowCount);

    });


  });
}

class MockDBHelper extends Mock implements DatabaseHelper {}
