import 'package:flutter/material.dart';
import 'package:training_journal/widgets/exercise_creator/circle_painter.dart';
import 'package:training_journal/widgets/exercise_creator/step_progress_indicator.dart';

class DifficultySelector extends StatefulWidget {
  @override
  _DifficultySelectorState createState() => _DifficultySelectorState();

  final Function(double) onDifficultySelected;

  DifficultySelector({this.onDifficultySelected});
}

class _DifficultySelectorState extends State<DifficultySelector> with AutomaticKeepAliveClientMixin<DifficultySelector> {
  double _value = 0;
  var difficultyMap = {
    0.0: "Easy",
    0.2: "Pretty easy",
    0.4: "Intermediate",
    0.6: "Pretty hard",
    0.8: "Hard",
    1.0: "Extreme"
  };

  var difficultyColorMap = {
    0.0: Color(0xFF41DDB5),
    0.2: Color(0xFFAAEEB3),
    0.4: Color(0xFFFFD166),
    0.6: Color(0xFFFF5F58),
    0.8: Color(0xFFFB362D),
    1.0: Color(0xFFFF0B00)
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            child: new CustomPaint(
              foregroundPainter: CirclePainter(
                  offset: Offset(MediaQuery.of(context).size.width + 1, -1),
                  radius: 150,
                  color: Color(0x8041DDB5)),
            ),
          )),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, top: 0, bottom: 8, right: 12),
                        child: Text(
                          "How difficult would you estimate the exercise was?",
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, top: 0, bottom: 8, right: 12),
                        child: Text(
                          "The estimation isn't based on numbers. It is relative to your training routine and other exercises",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SliderTheme(
                    data: SliderThemeData(
                        inactiveTrackColor: Color(0x5041DDB5),
                        valueIndicatorColor: difficultyColorMap[_value],
                        activeTickMarkColor: Colors.transparent,
                        inactiveTickMarkColor: Colors.transparent,
                        activeTrackColor: Theme.of(context).accentColor,
                        overlayColor: Theme.of(context).accentColor,
                        trackHeight: 10.0,
                        thumbColor: Theme.of(context).accentColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 16)),
                    child: Slider(
                        value: _value,
                        onChanged: (val) {
                          widget.onDifficultySelected(val);
                          setState(() {
                            _value = val;
                          });
                        },
                        divisions: 5,
                        label: difficultyMap[_value]),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: StepProgressIndicator(
              stepCount: 5,
              currentStep: 1,
            ),
          )
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
