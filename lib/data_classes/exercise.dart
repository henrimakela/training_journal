class Exercise {
  int id;
  String category;
  double difficulty;
  String description;
  String note;
  String name;
  DateTime timestamp;

  Exercise(
      {this.id,
      this.category,
      this.difficulty,
      this.description,
      this.note,
      this.name,
      this.timestamp});

  Exercise.fromMap(Map<String, dynamic> map) {

    this.id = map['id'];
    this.name =  map['name'];
    this.category = map['category'];
    this.description = map['description'];
    this.note = map['note'];
    this.difficulty = map['difficulty'];
    this.timestamp = DateTime.parse(map['timestamp']);
    print(this.difficulty);

  }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "category": this.category,
      "description": this.description,
      "note": this.note,
      "difficulty": this.difficulty,
      "timestamp": timestamp.toUtc().toString()
    };
  }
}
