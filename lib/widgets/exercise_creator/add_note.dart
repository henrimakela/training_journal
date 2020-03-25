
import 'package:flutter/material.dart';
import 'package:training_journal/widgets/exercise_creator/circle_painter.dart';
import 'package:training_journal/widgets/exercise_creator/step_progress_indicator.dart';

class AddNote extends StatefulWidget {

  final Function(String) onNoteChanged;
  AddNote({this.onNoteChanged});

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> with AutomaticKeepAliveClientMixin<AddNote>{

  TextEditingController _controller = TextEditingController();

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
                          offset: Offset(-1, MediaQuery.of(context).size.height * 0.4),
                          radius: 150,
                          color: Color(0x8041DDB5)),
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "How did you feel during and after the exercise?",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          "Did it go well? Is there room for improvement? Were you tired etc..",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: Theme.of(context).textTheme.body1,
                          controller: _controller,
                          onChanged: (val){
                            widget.onNoteChanged(val);
                          },
                          decoration: InputDecoration(
                              enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                              hintText: "I could improve my..."
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: StepProgressIndicator(
                  stepCount: 5,
                  currentStep: 3,
                ),
              )
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
