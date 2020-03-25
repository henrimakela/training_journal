

import 'package:flutter/material.dart';
import 'package:training_journal/widgets/exercise_creator/circle_painter.dart';
import 'package:training_journal/widgets/exercise_creator/step_progress_indicator.dart';

class AddName extends StatefulWidget {
  final Function(String) onNameChanged;
  final Function onFinish;

  AddName({this.onNameChanged, this.onFinish});

  @override
  _AddNameState createState() => _AddNameState();
}

class _AddNameState extends State<AddName> with AutomaticKeepAliveClientMixin<AddName>{
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
                      "What do you want to call this exercise?",
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
                      style: Theme.of(context).textTheme.body1,
                      controller: _controller,
                      onChanged: (val){
                        widget.onNameChanged(val);
                      },
                      decoration: InputDecoration(
                          enabledBorder: Theme.of(context)
                              .inputDecorationTheme
                              .enabledBorder,
                          focusedBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder,
                          hintText: "Leg day"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 50,
            right: 50,
            child: MaterialButton(
              onPressed: () {
                widget.onFinish();
              },
              elevation: 0,
              textColor: Colors.white,
              color: Color(0xFF41DDB5),
              shape: Theme.of(context).buttonTheme.shape,
              minWidth: Theme.of(context).buttonTheme.minWidth,
              height: Theme.of(context).buttonTheme.height,
              child: Text("Done"),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: StepProgressIndicator(
              stepCount: 5,
              currentStep: 4,
            ),
          )
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
