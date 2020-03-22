import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:training_journal/data_classes/exercise.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'exercise_journal.db';

    // Open/create the database at a given path
    var journalDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return journalDatabase;
  }

  Future<List<String>> getTableNames() async {
    var db = await this.database;

    List<String> nameList = List();

    List<Map> results =
        await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    results.forEach((element) {
      nameList.add(element['name']);
    });

    return nameList;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE Exercise(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, note TEXT, category TEXT, difficulty Real, timestamp TEXT)");

    await db.execute(
        "CREATE TABLE Recurring(id INTEGER PRIMARY KEY AUTOINCREMENT, exerciseID INTEGER, createdAt TEXT, recurringSchedule INTEGER)");
  }

  Future<List<Exercise>> getExercises() async {
    var db = await this.database;
    List<Map> results = await db.rawQuery('SELECT * FROM Exercise');
    List<Exercise> exercises = new List();
    results.forEach((element) {
      exercises.add(Exercise.fromMap(element));
    });
    return exercises;
  }

  Future<int> addRecurring(
      int eID, DateTime createdAt, int recurringSchedule) async {
    var db = await this.database;
    return await db.insert("Recurring", {
      "exerciseID": eID,
      "createdAt": createdAt.toIso8601String(),
      "recurringSchedule": recurringSchedule
    });
  }

  Future<List<Map<String, dynamic>>> getRecurringExercises() async {
    var db = await this.database;
    return db.rawQuery("SELECT * FROM Recurring");
  }

  Future<int> deleteRecurring(String eID) async {
    var db = await this.database;
    return await db
        .delete("Recurring", where: "exerciseID = ?", whereArgs: [eID]);
  }

  Future<int> updateRecurring(String eID, int recurringSchedule) async {
    var db = await this.database;
    return await db.update(
        "Recurring", {"recurringSchedule": recurringSchedule},
        where: "exerciseID = ?", whereArgs: [eID]);
  }

  Future<int> addExercise(Exercise exercise) async {
    var db = await this.database;
    var result = await db.insert('Exercise', exercise.toMap());
    return result;
  }

  Future<int> updateExercise(Exercise e) async {
    var db = await this.database;
    return await db.update("Exercise", e.toMap());
  }

  Future<int> deleteExercise(Exercise e) async {
    var db = await this.database;
    return await db.delete("Exercise", where: 'id = ?', whereArgs: [e.id]);
  }
}
