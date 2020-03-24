import 'package:flutter/material.dart';
import 'package:training_journal/widgets/exercise_creator/category_card.dart';
import 'package:training_journal/widgets/exercise_creator/circle_painter.dart';

import 'step_progress_indicator.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();

  final Function(String) onCategorySelected;

  CategorySelector({this.onCategorySelected});
}

class _CategorySelectorState extends State<CategorySelector> with AutomaticKeepAliveClientMixin<CategorySelector>{

  List<Widget> _createCategoryCards() {
    return [
      CategoryCard(
        text: "Weights",
        image: "weight_green.png",
        onCategorySelected: widget.onCategorySelected,
      ),
      CategoryCard(
        text: "Cardio",
        image: "cardio_green.png",
        onCategorySelected: widget.onCategorySelected,
      ),
      CategoryCard(
        text: "Combat",
        image: "kicking_green.png",
        onCategorySelected: widget.onCategorySelected,
      ),
      CategoryCard(
        text: "Yoga",
        image: "yoga_green.png",
        onCategorySelected: widget.onCategorySelected,
      ),
      CategoryCard(
        text: "Breathing",
        image: "wind_green.png",
        onCategorySelected: widget.onCategorySelected,
      ),
      CategoryCard(
        text: "Meditation",
        image: "meditation_green.png",
        onCategorySelected: widget.onCategorySelected,
      ),
      CategoryCard(
        text: "Music",
        image: "music_green.png",
        onCategorySelected: widget.onCategorySelected,
      )
    ];
  }

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, top: 0, bottom: 8, right: 12),
                      child: Text(
                        "In what category did your exercise fall into?",
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, top: 0, bottom: 8, right: 12),
                      child: Text(
                        "If you're unsure about the category thing, just select other. It'll be only used to display an icon.",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: _createCategoryCards(),
                      childAspectRatio: 0.75,
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
              currentStep: 0,
            ),
          )
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
