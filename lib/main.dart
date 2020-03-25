import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_journal/bloc/exercise_creator_bloc.dart';
import 'package:training_journal/repository/main_repository.dart';
import 'package:training_journal/bloc/exercise_bloc.dart';
import 'package:training_journal/screens/week_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  ThemeData _buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
        splashFactory: InkRipple.splashFactory,
        appBarTheme: AppBarTheme(
            color: Color(0xFFF2F2F2),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.grey),
            actionsIconTheme: IconThemeData(color: Colors.grey)),
        accentColor: Color(0xFF41DDB5),
        backgroundColor: Color(0xFFF2F2F2),
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF41DDB5), width: 1.0))),
        buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF41DDB5),
            minWidth: 270,
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        textTheme: TextTheme(
            title: TextStyle(
                color: Color(0xFF4F4F4F),
                fontWeight: FontWeight.bold,
                fontSize: 24),
            body1: TextStyle(color: Color(0xFF828282)),
            subtitle: TextStyle(
                color: Color(0xFFBDBDBD), fontWeight: FontWeight.bold)));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ExerciseBloc>(
          create: (context) => ExerciseBloc(repository: MainRepository()),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<ExerciseCreatorBloc>(
          create: (context) =>
              ExerciseCreatorBloc(repository: MainRepository()),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
          title: 'Exercise Journal',
          theme: _buildTheme(),
          home: Scaffold(body: WeekList())),
    );
  }
}
