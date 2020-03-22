
import 'package:flutter/material.dart';
import 'package:training_journal/data_classes/day.dart';
import 'package:training_journal/widgets/week_card.dart';

class WeekView extends StatelessWidget {

  List<Day> week;
  int weekNumber;

  WeekView({this.week, this.weekNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 16.0,bottom: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
                tag: weekNumber,
                child: WeekCard(week: week, weekNumber: weekNumber,)),

           ListView(
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             children: week.map((d) => Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               child: ListTile(title: Text(d.date.toString(), style: Theme.of(context).textTheme.subtitle,),),
             )).toList()
           )
          ],
        ),
      ),
    );
  }
}
