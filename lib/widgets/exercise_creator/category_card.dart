import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_journal/widgets/soft_elevated_container.dart';

class CategoryCard extends StatelessWidget {
  String image;
  String text;
  bool selected;
  final Function(String) onCategorySelected;

  CategoryCard({this.onCategorySelected, this.text, this.selected, this.image});


  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                color: isDarkMode ? Colors.black : Color(0xFFDFDFDF),
                offset: Offset(5, 5),
                blurRadius: 15,
              ),
              BoxShadow(
                color: isDarkMode ? Color(0xFF1E1E1E) : Colors.white,
                offset: Offset(-5, -5),
                blurRadius: 15,
              ),
            ]
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            splashColor: Theme.of(context).accentColor,
            onTap: (){
              onCategorySelected(text);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/$image",
                  width: 32,
                  height: 32,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: selected ? TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor) : TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ));
  }
}
