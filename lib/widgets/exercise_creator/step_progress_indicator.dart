
import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  int currentStep;
  int stepCount;

  StepProgressIndicator({this.currentStep, this.stepCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _createSteps(stepCount: stepCount, currentStep: currentStep),
    );
  }

  _createSteps({int stepCount, int currentStep}) {
    List<Widget> steps = [];
    for (int i = 0; i < stepCount; i++) {
      if (i == currentStep) {
        steps.add(Container(
          margin: EdgeInsets.all(2),
          width: 10,
          height: 10,
          decoration:
          BoxDecoration(color: Color(0x8041DDB5), shape: BoxShape.circle),
        ));
      } else {
        steps.add(Container(
          margin: EdgeInsets.all(2),
          width: 10,
          height: 10,
          decoration:
          BoxDecoration(color: Colors.grey[500], shape: BoxShape.circle),
        ));
      }
    }

    return steps;
  }
}
