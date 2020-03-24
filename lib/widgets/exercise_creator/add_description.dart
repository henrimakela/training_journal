
import 'package:flutter/material.dart';
import 'package:training_journal/widgets/exercise_creator/circle_painter.dart';
import 'package:training_journal/widgets/exercise_creator/step_progress_indicator.dart';

class AddDescription extends StatefulWidget {

  final Function(String) onDescriptionChanged;

  AddDescription({this.onDescriptionChanged});

  @override
  _AddDescriptionState createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> with AutomaticKeepAliveClientMixin<AddDescription>{

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
                          offset: Offset(-1, -1),
                          radius: 150,
                          color: Color(0x8041DDB5)),
                    ),
                  )),
              Positioned(
                  child: Container(
                    child: new CustomPaint(
                      foregroundPainter: CirclePainter(
                          offset: Offset(MediaQuery.of(context).size.width + 1, MediaQuery.of(context).size.height * 0.4),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "What did the exercise consist of?",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          "It'll show up in the detail view",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _controller,
                          onChanged: (val){
                            widget.onDescriptionChanged(val);
                          },
                          decoration: InputDecoration(
                              enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                            hintText: "Three rounds of..."
                          ),
                        ),

                        SizedBox(
                          height: 20,
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
                  currentStep: 2,
                ),
              )
            ],

          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
