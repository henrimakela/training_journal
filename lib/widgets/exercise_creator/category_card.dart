import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class CategoryCard extends StatelessWidget {
  String image;
  String text;

  CategoryCard({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFDFDFDF),
                offset: Offset(5, 5),
                blurRadius: 15,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, -5),
                blurRadius: 15,
              ),
            ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/$image",
              width: 48,
              height: 48,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle,
            )
          ],
        ));
  }
}
