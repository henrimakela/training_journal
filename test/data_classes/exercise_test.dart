import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:training_journal/data_classes/exercise.dart';

main() {
  group("fromMap", () {

    test("should return an exercise object", () {
      var map = {
        "id": 1,
        "name": "madness",
        "category": "weights",
        "description": "yaada",
        "note": "yadidaa",
        "difficulty": 0.2,
        "timestamp": DateTime.now().toIso8601String()
      };

      var e = Exercise.fromMap(map);

      assert(e is Exercise);

    });

    test("should return a map", (){

      Exercise e = Exercise(id: 1, name: "madness", category: "weights", description: "yolo", note: "yopo", timestamp: DateTime.now());
      var map = e.toMap();
      assert(map is Map);
    });



  });
}
