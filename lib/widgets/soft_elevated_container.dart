
import 'package:flutter/material.dart';

class SoftElevatedContainer extends StatelessWidget {

  Widget child;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry padding;
  
  SoftElevatedContainer({this.margin, this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
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
