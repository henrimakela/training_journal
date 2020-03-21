import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/db/database_helper.dart';
import 'package:training_journal/repository/main_repository.dart';

class MockRepository extends Mock implements MainRepository {}
class MockDatabaseHelper extends Mock implements DatabaseHelper{}

void main() {
  test("should return true if success", () async {

    var dbHelper = MockDatabaseHelper();
    var e = Exercise(
        id: 1,
        name: "madness",
        category: "weights",
        description: "yolo",
        note: "yopo",
        timestamp: DateTime.now());

  });

  test("should return false if couldnt add exercise", () {});
}
