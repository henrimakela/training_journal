import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/data_classes/exercise.dart';
import 'package:training_journal/screens/week_list.dart';
import 'package:training_journal/util/string_utils.dart';
import 'package:training_journal/widgets/exercise_creator/category_card.dart';

class NewExerciseScreen extends StatefulWidget {
  @override
  _NewExerciseScreenState createState() => _NewExerciseScreenState();
}

class _NewExerciseScreenState extends State<NewExerciseScreen> {
  Exercise draft = Exercise(
      name: "",
      description: "",
      category: "",
      difficulty: 1.0,
      note: "",
      timestamp: DateTime.now());

  String onCategorySelected(String cat) {
    setState(() {
      draft.category = cat;
    });
  }

  List<Widget> _createCategoryCards() {
    return [
      CategoryCard(
        text: "Weights",
        image: "weight_green.png",
        selected: draft.category == "Weights",
        onCategorySelected: onCategorySelected,
      ),
      CategoryCard(
        text: "Cardio",
        image: "cardio_green.png",
        selected: draft.category == "Cardio",
        onCategorySelected: onCategorySelected,
      ),
      CategoryCard(
        text: "Combat",
        image: "kicking_green.png",
        selected: draft.category == "Combat",
        onCategorySelected: onCategorySelected,
      ),
      CategoryCard(
        text: "Yoga",
        image: "yoga_green.png",
        selected: draft.category == "Yoga",
        onCategorySelected: onCategorySelected,
      ),
      CategoryCard(
        text: "Breathing",
        image: "wind_green.png",
        selected: draft.category == "Breathing",
        onCategorySelected: onCategorySelected,
      ),
      CategoryCard(
        text: "Meditation",
        image: "meditation_green.png",
        selected: draft.category == "Meditation",
        onCategorySelected: onCategorySelected,
      ),
      CategoryCard(
        text: "Music",
        image: "music_green.png",
        selected: draft.category == "Music",
        onCategorySelected: onCategorySelected,
      ),
      CategoryCard(
        text: "Other",
        image: "other_green.png",
        selected: draft.category == "Other",
        onCategorySelected: onCategorySelected,
      )
    ];
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Select a category",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              Container(
                height: 120,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: _createCategoryCards(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 32.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.body1,
                  onSaved: (val) {
                    draft.name = val;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: Theme.of(context).textTheme.body2,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 32.0),
                child: TextFormField(
                  onSaved: (val) {
                    draft.description = val;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.body1,
                  onChanged: (val) {},
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: Theme.of(context).textTheme.body2,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 32.0),
                child: TextFormField(
                  onSaved: (val) {
                    draft.note = val;
                  },
                  style: Theme.of(context).textTheme.body1,
                  onChanged: (val) {},
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: "Note to self",
                    labelStyle: Theme.of(context).textTheme.body2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Difficulty",
                    style: Theme.of(context).textTheme.body2),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SliderTheme(
                    data: SliderThemeData(
                        inactiveTrackColor: Color(0x5041DDB5),
                        valueIndicatorColor:
                            StringUtils.difficultyColorMap[draft.difficulty],
                        activeTickMarkColor: Colors.transparent,
                        inactiveTickMarkColor: Colors.transparent,
                        activeTrackColor: Theme.of(context).accentColor,
                        overlayColor: Theme.of(context).accentColor,
                        trackHeight: 10.0,
                        thumbColor: Theme.of(context).accentColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 16)),
                    child: Slider(
                        min: 1.0,
                        max: 6.0,
                        value: draft.difficulty,
                        onChanged: (val) {
                          setState(() {
                            draft.difficulty = val;
                          });
                        },
                        divisions: 5,
                        label: StringUtils.difficultyMap[draft.difficulty]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Divider(
                  height: 1.0,
                  thickness: 1.0,
                  indent: 0.2,
                  endIndent: 0.8,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Add timestamp",
                      style: Theme.of(context).textTheme.title,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        pickADate(context).then((date) {
                          if (date != null) {
                            setState(() {
                              draft.timestamp = date;
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                    "If you did this exercise earlier, you can provide the date and time manually. Otherwise the exercise will be saved with the current date"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  DateFormat("dd.MM.yyyy").format(draft.timestamp),
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Divider(
                  height: 1.0,
                  thickness: 1.0,
                  indent: 0.2,
                  endIndent: 0.8,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, bottom: 80.0),
                child: MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      Provider.of<ExerciseBloc>(context, listen: false)
                          .addExercise(draft);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeekList()),
                      );
                    }
                  },
                  elevation: 0,
                  textColor: Colors.white,
                  color: Color(0xFF41DDB5),
                  shape: Theme.of(context).buttonTheme.shape,
                  minWidth: Theme.of(context).buttonTheme.minWidth,
                  height: Theme.of(context).buttonTheme.height,
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime> pickADate(BuildContext context) async {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (BuildContext context, Widget child) {
          if (isDarkMode) {
            return Theme(
              data: Theme.of(context).copyWith(
                dialogBackgroundColor: Theme.of(context)
                    .dialogTheme
                    .backgroundColor, //Background color
              ),
              child: Builder(
                builder: (context) {
                  return child;
                },
              ),
            );
          } else {
            return Theme(
              data: Theme.of(context).copyWith(

                primaryColor: Colors.black,
                  dialogBackgroundColor: Theme.of(context)
                      .dialogTheme
                      .backgroundColor
              ),
              child: Builder(
                  builder: (context){
                    return child;
                  }),
            );
          }
        });

    if (picked != null) {
      print(picked);
    }
    return picked;
  }
}
