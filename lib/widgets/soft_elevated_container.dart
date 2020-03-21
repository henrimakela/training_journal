
import 'package:flutter/material.dart';

class SoftElevatedContainer extends StatelessWidget {

  Widget child;
  double margin;
  double padding;
  
  SoftElevatedContainer({this.margin, this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDFDFDF),
            offset: Offset(6, 6),
            blurRadius: 15,
          ),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-6, -6),
              blurRadius: 15,
          ),
        ]
      ),
      child: this.child,
    );
  }
}
